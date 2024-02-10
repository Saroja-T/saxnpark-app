import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../bottomsheets/location_details.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class ParkingTime extends StatefulWidget {
  const ParkingTime({super.key});
  @override
  State<ParkingTime> createState() => _ParkingTimeState();
}

class _ParkingTimeState extends State<ParkingTime> {
  var searchedText;
  bool countrySelected = false;
  var selectedIndex = 0;
  bool inCorrectSearch = true;
  bool starSelected = false;
  String tabLabel = "";
  String driveInTime = "Select Date and Time";
  String driveOutTime = "Select Date and Time";
  String duration = "Select Date and Time";
  bool isDuration = false;
  String price = "";
  DateTime? driveIn;
  DateTime? driveOut;
  List<String> titleList = [Strings.justParking, Strings.visiting];
  List<VehicleDetails> vehicleDetails = [
    VehicleDetails(
        vehicleName: Strings.dummyvehicle1,
        vehicleCategory: Strings.dummyCategory1),
    VehicleDetails(
        vehicleCategory: Strings.dummyCategoey2,
        vehicleName: Strings.dummyvehicle2)
  ];

  static int calculateTimeDifferenceBetween(
      {required DateTime startDate, required DateTime endDate}) {
    return startDate.difference(endDate).inHours;

    // if (seconds < 60)
    //   return '$seconds second';
    // else if (seconds >= 60 && seconds < 3600)
    //   return '${startDate.difference(endDate).inMinutes.abs()} minute';
    // else if (seconds >= 3600 && seconds < 86400)
    //   return '${startDate.difference(endDate).inHours} hour';
    // else
    //   return '${startDate.difference(endDate).inDays} day';
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return Scaffold(
      appBar: CustomAppBarWithBack(
        title: Strings.bookingDetails,
        backText: Strings.back,
        redirectionKey: Strings.rVehicleType,
        tabIndex: 1,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   padding: const EdgeInsets.all(8),
                //   margin: const EdgeInsets.only(bottom: 16),
                //   decoration: BoxDecoration(
                //     color: AppColors.red1.withOpacity(0.1),
                //     borderRadius: const BorderRadius.all(Radius.circular(8)),
                //   ),
                //   child: Column(
                //     children: [
                //       Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Image.asset(warning),
                //           const SizedBox(
                //             width: 8,
                //           ),
                //           Flexible(
                //             child: Text(
                //               Strings.slotUnavailableWarning,
                //               softWrap: true,
                //               maxLines: 3,
                //               style: customTextStyle(
                //                   12, FontWeight.w400, AppColors.black5, 1.5),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  Strings.parkingTime,
                  style:
                      customTextStyle(20, FontWeight.w500, AppColors.black1, 1),
                ),
                const SizedBox(height: 25),
                Text(
                  Strings.validFrom,
                  style:
                      customTextStyle(16, FontWeight.w400, AppColors.black1, 1),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    driveIn = await showOmniDateTimePicker(
                        context: context,
                        is24HourMode: true,
                        firstDate: DateTime.now());
                    final now = DateTime.now();
                    final today = DateTime(now.year, now.month, now.day);
                    final tomorrow = DateTime(now.year, now.month, now.day + 1);

                    var timeVal = DateFormat.Hm().format(driveIn!);
                    final dateToCheck = driveIn!;
                    final aDate = DateTime(
                        dateToCheck.year, dateToCheck.month, dateToCheck.day);
                    setState(() {
                      if (aDate == today) {
                        driveInTime = "${Strings.todayText} $timeVal";
                      } else if (aDate == tomorrow) {
                        driveInTime = "${Strings.tomorrowText} $timeVal";
                      } else {
                        driveInTime =
                            "${DateFormat.yMd('es').format(driveIn!)} $timeVal";
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: AppColors.grey4)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              driveInTime,
                              style: customTextStyle(
                                  14, FontWeight.w400, AppColors.black6, 1),
                            ),
                            Image.asset(calender)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if(isDuration)
                errorWidget(Strings.slotUnavailableWarning),
                const SizedBox(height: 20,),
                Text(
                  Strings.validUntil,
                  style:
                      customTextStyle(16, FontWeight.w400, AppColors.black1, 1),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    driveOut = await showOmniDateTimePicker(
                        context: context,
                        is24HourMode: true,
                        firstDate: driveIn,
                        initialDate: driveIn);
                    initializeDateFormatting();
                    final now = DateTime.now();
                    final today = DateTime(now.year, now.month, now.day);
                    final tomorrow = DateTime(now.year, now.month, now.day + 1);

                    var timeVal = DateFormat.Hm().format(driveOut!);
                    final dateToCheck = driveOut!;
                    final aDate = DateTime(
                        dateToCheck.year, dateToCheck.month, dateToCheck.day);
                    setState(() {
                      var totHours = calculateTimeDifferenceBetween(
                          startDate: driveOut!, endDate: driveIn!);
                      print("tohours $totHours");
                      if (totHours > 0) {
                        if (aDate == today) {
                          driveOutTime = "${Strings.todayText} $timeVal";
                        } else if (aDate == tomorrow) {
                          driveOutTime = "${Strings.tomorrowText} $timeVal";
                        } else {
                          driveOutTime =
                              "${DateFormat.yMd('es').format(driveOut!)} $timeVal";
                        }
                        duration = '$totHours hour';
                      } else {
                        duration = "Select Date and Time";
                        showNegativeToast(
                            "Drive in time should be greater than drive out");
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: AppColors.grey4)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              driveOutTime,
                              style: customTextStyle(
                                  14, FontWeight.w400, AppColors.black6, 1),
                            ),
                            Image.asset(calender)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.duration,
                            style: customTextStyle(
                                16, FontWeight.w400, AppColors.black1, 1),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: AppColors.grey12,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color:const Color.fromRGBO(133, 133, 133, 0.1))),
                            child: SizedBox.expand(
                                child: Text(
                              duration,
                              style: customTextStyle(
                                  14, FontWeight.w400, AppColors.black6, 1),
                            )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.price,
                            style: customTextStyle(
                                16, FontWeight.w400, AppColors.black1, 1),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: AppColors.grey12,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color:const Color.fromRGBO(133, 133, 133, 0.1))),
                            child: SizedBox.expand(
                                child: Text(
                              price,
                              style: customTextStyle(
                                  14, FontWeight.w400, AppColors.black6, 1),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                      onTap: () {
                        showLocationBottomSheet(context, starSelected);
                      },
                      child: Center(
                          child: Text(
                        Strings.viewPrices,
                        style: customTextStyle(
                            16, FontWeight.w400, AppColors.black6, 1),
                      ))),
                ),
                SizedBox(
                  height: 51,
                  child: SizedBox.expand(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.black6),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ))),
                        onPressed: () {
                          context.read<LandingBloc>().add(TabChangeEvent(
                              tabIndex: 1, tabLabel: Strings.rBookingDetails));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Strings.next,
                              style: customTextStyle(
                                  14, FontWeight.w600, AppColors.white, 1),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VehicleDetails {
  String? vehicleName;
  String? vehicleCategory;

  VehicleDetails({required this.vehicleName, required this.vehicleCategory});
}

showBrandsBottomSheet() {
  return Container(
    height: 200,
    width: double.infinity,
    color: Colors.green,
    child: const Text("test"),
  );
}
