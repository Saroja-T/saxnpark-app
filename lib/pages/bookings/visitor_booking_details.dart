import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class VisitorBookingDetaills extends StatefulWidget {
  const VisitorBookingDetaills({super.key});

  @override
  State<VisitorBookingDetaills> createState() => VisitorBookingDetaillsState();
}

class VisitorBookingDetaillsState extends State<VisitorBookingDetaills> {
  String tabLabel = "";
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return Scaffold(
      appBar: CustomAppBarWithBack(title: Strings.bookingConfirmation,backText: Strings.back,tabIndex: 1,redirectionKey: Strings.rParkTime,),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      Row(
                        children: [
                          Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                Strings.dummyBookingLocation,
                                style: customTextStyle(
                                    16, FontWeight.w600, AppColors.black6, 0),
                              )),
                              SizedBox(width: 4,),
                               GestureDetector(
              onTap: vehicleTypeChange,
              child: Text(
                Strings.change,
                style: customTextStyle(16, FontWeight.w400, AppColors.blue1, 0),
              ),
            ),
                        ],
                      ),
                        
                          const SizedBox(height: 10,),
                          Text(
                        Strings.hostText,
                        style: customTextStyle(
                            14, FontWeight.w400, AppColors.black6, 0),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                Strings.dummyBookingLocation2,
                                style: customTextStyle(
                                    16, FontWeight.w600, AppColors.black6, 0),
                              )),
                             const SizedBox(width: 4,),
                              GestureDetector(
              onTap: vehicleTypeChange,
              child: Text(
                Strings.change,
                style: customTextStyle(16, FontWeight.w400, AppColors.blue1, 0),
              ),
            ),
                        ],
                      )
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
                          vehicleTypeChange),
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
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.requestParking,
                            style: customTextStyle(
                                14, FontWeight.w600, AppColors.white, 1),
                          ),
                        ],
                      )),
                ),
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
  Widget customListRow(String icon, String title, String text1, bool isCircle,
      String text2, bool isChangeble, Function() onChangeFunction) {
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
          if (isChangeble)
            GestureDetector(
              onTap: onChangeFunction,
              child: Text(
                Strings.change,
                style: customTextStyle(16, FontWeight.w400, AppColors.blue1, 0),
              ),
            ),
        ]),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
