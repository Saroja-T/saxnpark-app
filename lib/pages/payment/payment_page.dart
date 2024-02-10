import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:pay/pay.dart' as pay;

import 'package:saxnpark_app/.env.example.dart';
import 'package:saxnpark_app/bloc/landing/landing_bloc.dart';
import 'package:saxnpark_app/commons/custom_app_bar.dart';
import 'package:saxnpark_app/pages/payment/config.dart';
import 'package:saxnpark_app/pages/payment/service.dart';
import 'package:saxnpark_app/utils/colors.dart';
import 'package:saxnpark_app/utils/constants.dart';
import 'package:saxnpark_app/utils/strings.dart';
import 'package:saxnpark_app/utils/styles.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String tabLabel = "";
  List<String> titleList = [
    "Make Payment With Card",
    "Pay with GPay",
    "Pay with Apple Login"
  ];
  List<pay.PaymentItem> paymentItems = [
    const pay.PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: pay.PaymentItemStatus.final_price,
    )
  ];

  var selectedIndex;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return Scaffold(
      appBar: CustomAppBarWithBack(
        title: Strings.bookingDetails,
        backText: Strings.back,
        redirectionKey: Strings.rPurpose,
        tabIndex: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.methodToPay,
              style: customTextStyle(20, FontWeight.w500, AppColors.black1, 1),
            ),
            const SizedBox(height: 26),
            InkWell(
              onTap: () async {
                await StripePaymentService().makePayment(context);
              },
              child: Container(
                  width: w! * 0.95,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      color: AppColors.blue1,
                      borderRadius: const BorderRadius.all(Radius.circular(23)),
                      border: Border.all(color: AppColors.blue1)),
                  child: Text(
                    textAlign: TextAlign.center,
                    titleList[0],
                    style: customTextStyle(
                        18, FontWeight.w400, AppColors.white, 1),
                  )),
            ),
            // Displays Google button
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: pay.GooglePayButton(
                height: 50,
                width: w! * 0.95,
                paymentConfiguration: pay.PaymentConfiguration.fromJsonString(
                  _paymentProfile,
                ),
                paymentItems: paymentItems,
                margin: const EdgeInsets.only(top: 15),
                onPaymentResult: onGooglePayResult,
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
                onPressed: () async {},
                childOnError:
                    const Text('Google Pay is not available in this device'),
                onError: (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'There was an error while trying to perform the payment'),
                    ),
                  );
                },
              ),
            )

            
          ],
        ),
      ),
    );
  }

  Future<void> onGooglePayResult(paymentResult) async {
    try {
      debugPrint(paymentResult.toString());
      // 2. fetch Intent Client Secret from backend
      final response = await fetchPaymentIntentClientSecret();
      final clientSecret = response['clientSecret'];
      final token =
          paymentResult['paymentMethodData']['tokenizationData']['token'];
      final tokenJson = Map.castFrom(json.decode(token));
      debugPrint(tokenJson.toString());

      final params = PaymentMethodParams.cardFromToken(
        paymentMethodData: PaymentMethodDataCardFromToken(
          token: tokenJson['id'], // TODO extract the actual token
        ),
      );

      // 3. Confirm Google pay payment method
      await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: clientSecret,
        data: params,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Google Pay payment succesfully completed')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Future<Map<String, dynamic>> fetchPaymentIntentClientSecret() async {
    final url = Uri.parse('$kApiUrl/create-payment-intent');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': 'example@gmail.com',
        'currency': 'usd',
        'items': ['id-1'],
        'request_three_d_secure': 'any',
      }),
    );
    return json.decode(response.body);
  }
}

final _paymentProfile = """{
  "provider": "google_pay",
  "data": {
    "environment": "TEST",
    "apiVersion": 2,
    "apiVersionMinor": 0,
    "allowedPaymentMethods": [
      {
        "type": "CARD",
        "tokenizationSpecification": {
          "type": "PAYMENT_GATEWAY",
          "parameters": {
            "gateway": "stripe",
            "stripe:version": "2020-08-27",
            "stripe:publishableKey": "$stripePublishableKey"
          }
        },
        "parameters": {
          "allowedCardNetworks": ["VISA", "MASTERCARD"],
          "allowedAuthMethods": ["PAN_ONLY", "CRYPTOGRAM_3DS"],
          "billingAddressRequired": true,
          "billingAddressParameters": {
            "format": "FULL",
            "phoneNumberRequired": true
          }
        }
      }
    ],
    "merchantInfo": {
      "merchantId": "01234567890123456789",
      "merchantName": "Example Merchant Name"
    },
    "transactionInfo": {
      "countryCode": "US",
      "currencyCode": "USD"
    }
  }
}""";
