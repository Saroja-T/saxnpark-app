import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/notification_banner.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';
import '../payment/payment_page.dart';

class BookingPreview extends StatefulWidget {
  const BookingPreview({super.key});

  @override
  State<BookingPreview> createState() => BookingPreviewState();
}

class BookingPreviewState extends State<BookingPreview> {
  String tabLabel = "";
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return Scaffold(
      appBar: CustomAppBar(title: Strings.bookingConfirmation),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(Strings.isPaymentFailed)
              NotificationBanner(
                      message: Strings.paymentFailure,
                      isCancelAvailable: true,
                      isErrorMsg: true,
                      onCancel: () {
                        setState(() {
                          Strings.isPaymentFailed = false;
                        });
                      },
                    ),
              if(Strings.isPaymentFailed)
              const SizedBox(height: 15,),
              Text(
                Strings.bookingConfirmationTitle,
                style:
                    customTextStyle(20, FontWeight.w500, AppColors.black1, 1),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: AppColors.grey4)),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.location,
                        style: customTextStyle(
                            14, FontWeight.w400, AppColors.black6, 0),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            Strings.dummyBookingLocation,
                            style: customTextStyle(
                                16, FontWeight.w600, AppColors.black6, 0),
                          ))
                    ]),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: AppColors.grey4)),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customListRow(
                          home,
                          Strings.vehicle,
                          Strings.dummyCategory1,
                          true,
                          Strings.dummyvehicle1,
                          true,
                          vehicleTypeChange,
                          false),
                      customListRow(clock, Strings.validFrom, Strings.today,
                          true, Strings.dummyTime, true, bookingTimeChange,false),
                      customListRow(clock, Strings.validTo, Strings.today,
                          true, Strings.dummyTime, true, bookingTimeChange,false),
                      customListRow(
                          duration,
                          Strings.duration,
                          "${Strings.dummyDuration} ${Strings.minutes}",
                          false,
                          "",
                          true,
                          bookingTimeChange,false),
                      
                    ]),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: AppColors.grey4)),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customListRow1(Strings.parkingFee, "\$2.40"),
                      customListRow1(Strings.taxes, "\$2.40"),
                      customListRow1(Strings.serviceFee, "\$2.40"),
                      customListRow1(Strings.total, "\$2.40"),
                       customListRow(cardHolder, Strings.paymentMethod,
                          Strings.dummyPaymentMethod, false, "", true, bookingTimeChange,true),
                    ]),
              ),
              SizedBox(
                height: 51,
                child: SizedBox.expand(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.black6),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ))),
                      onPressed: () {
                        //    context.read<LandingBloc>().add(TabChangeEvent(
                        // tabIndex: 1, tabLabel: Strings.rBookingConfirmation));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const PaymentPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.confirmAndPay,
                            style: customTextStyle(
                                14, FontWeight.w600, AppColors.white, 1),
                          ),
                        ],
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  vehicleTypeChange() {
    context
        .read<LandingBloc>()
        .add(TabChangeEvent(tabIndex: 1, tabLabel: Strings.rVehicleType));
  }

  bookingTimeChange() {
    //  context.read<LandingBloc>().add(TabChangeEvent(
    //                   tabIndex: 1, tabLabel: Strings.rVehicleType));
  }
  
}
