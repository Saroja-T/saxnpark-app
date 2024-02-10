import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class BookingConfirmation extends StatefulWidget {
  const BookingConfirmation({super.key});

  @override
  State<BookingConfirmation> createState() => BookingConfirmationState();
}

class BookingConfirmationState extends State<BookingConfirmation> {
  String tabLabel = "";
  LatLng initialLocation = const LatLng(37.422131, -122.084801);
  Map<MarkerId, Marker> markers =
      <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS

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
              Text(
                Strings.bookingConfirmed,
                style:
                    customTextStyle(20, FontWeight.w500, AppColors.black1, 1),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color.fromRGBO(41, 170, 243, 0.1)),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        info,
                        color: AppColors.black6,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Flexible(child: Text(Strings.dummyBookingMsg))
                    ]),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: AppColors.grey4)),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            Strings.dummyBookingLocation,
                            style: customTextStyle(
                                16, FontWeight.w600, AppColors.black6, 0),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        Strings.dummyBookingLocation1,
                        style: customTextStyle(
                            14, FontWeight.w400, AppColors.black6, 0),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 109,
                        child: GoogleMap(
                          onTap: (LatLng) {
                            print("dfdfdf");
                          },
                          initialCameraPosition: CameraPosition(
                            target: initialLocation,
                            zoom: 14,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        Strings.getDirections,
                        style: customTextStyle(
                            16, FontWeight.w400, AppColors.blue1, 0),
                      ),
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
                      custoListRow(
                        home,
                        Strings.vehicle,
                        Strings.dummyCategory1,
                        true,
                        Strings.dummyvehicle1,
                      ),
                      custoListRow(clock, Strings.validFrom, Strings.today,
                          true, Strings.dummyTime),
                      custoListRow(clock, Strings.validTo, Strings.today, true,
                          Strings.dummyTime1),
                      custoListRow(
                          duration,
                          Strings.duration,
                          "${Strings.dummyDuration} ${Strings.minutes}",
                          false,
                          ""),
                      custoListRow(duration, Strings.space, Strings.dummySpace,
                          false, ""),
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
                      customListRow(
                          cardHolder,
                          Strings.paymentMethod,
                          Strings.dummyPaymentMethod,
                          false,
                          "",
                          true,
                          paymentChange,
                          true),
                    ]),
              ),
              const SizedBox(
                height: 5,
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
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.goToBookings,
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

  Widget custoListRow(
    String icon,
    String title,
    String text1,
    bool isCircle,
    String text2,
  ) {
    return Column(
      children: [
        Row(children: [
          Image.asset(
            icon,
            color: AppColors.black6,
          ),
          const SizedBox(
            width: 4,
          ),
          Flexible(
              child: Text(
            title,
            style: customTextStyle(14, FontWeight.w400, AppColors.black6, 0),
          ))
        ]),
        const SizedBox(
          height: 4,
        ),
        Row(children: [
          Text(
            text1,
            style: customTextStyle(16, FontWeight.w600, AppColors.black6, 0),
          ),
          const SizedBox(
            width: 4,
          ),
          if (isCircle)
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: AppColors.black6,
                  size: 4,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  text2,
                  style:
                      customTextStyle(16, FontWeight.w600, AppColors.black6, 0),
                ),
                const SizedBox(
                  width: 4,
                ),
              ],
            ),
        ]),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  paymentChange() {}
}
