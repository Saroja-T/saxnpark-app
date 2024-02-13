import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:saxnpark_app/pages/permits/active_permits.dart';
import 'package:saxnpark_app/pages/permits/past_permits.dart';
import 'package:saxnpark_app/utils/buttons/custom_border_botton.dart';
import 'package:saxnpark_app/utils/buttons/custom_button.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/curved_dialog.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/notification_banner.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';
import 'pending_permits.dart';

class VisitRequest extends StatefulWidget {
  const VisitRequest({super.key});
  @override
  State<VisitRequest> createState() => VisitRequestState();
}

class VisitRequestState extends State<VisitRequest>
    with TickerProviderStateMixin {
  bool countrySelected = false;
  bool inCorrectSearch = true;
  bool starSelected = false;
  String tabLabel = "";
  String activeOption = Strings.pending;
  late TabController _tabController;
  String driveInTime = "Select Date and Time";
  String driveOutTime = "Select Date and Time";
  String duration = "Select Date and Time";
  bool isDuration = false;
  String price = "";
  DateTime? driveIn;
  DateTime? driveOut;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    final double dialogWidth = MediaQuery.of(context).size.width * 0.2;
    final double dialogHeight = MediaQuery.of(context).size.height * 0.2;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    var theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: Strings.visitRequest),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (Strings.isPermitSuccess)
                NotificationBanner(
                  message: Strings.permitSuccess,
                  isCancelAvailable: true,
                  isErrorMsg: false,
                  onCancel: () {
                    setState(() {
                      Strings.isPermitSuccess = false;
                    });
                  },
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
                      const SizedBox(
                        height: 10,
                      ),
                      commonWidget(
                          Strings.location, Strings.dummyBookingLocation),
                      commonWidget(Strings.hostText, "John smith"),
                      commonWidget1(Strings.vehicle, Strings.dummyCategory1,
                          Strings.dummyvehicle1, true),
                      const SizedBox(
                        height: 5,
                      ),
                    ]),
              ),
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
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
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
              const SizedBox(
                height: 20,
              ),
              Text(
                Strings.validTo,
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
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
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
              if (isDuration)
                Text(
                  Strings.noParking,
                  style:
                      customTextStyle(12, FontWeight.w400, AppColors.red1, 1.2),
                ),
              SizedBox(
                height: h! * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                      child: CustomBorderButton(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Material(
                                    color: Colors
                                        .white, // Set the background color to white
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Strings.reasonForRejection,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.black6),
                                          ),
                                          SizedBox(height: h!*0.02,),
                                          SizedBox(
                                            height: h!*
                                                0.06,
                                            width: w! *
                                                0.9,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.all(10.0),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    borderSide:const BorderSide(
                                                        color: 
                                                            Color.fromRGBO(221, 220, 220, 1))),
                                                hintStyle: const TextStyle(
                                                    color: Color.fromARGB(
                                                        96, 96, 96, 1),
                                                    fontSize: 14.0),
                                                hintText: "",
                                              ),
                                              onChanged: (value) {
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: CustomBorderButton(buttonText: Strings.cancel,
                                                onTap: (){
                                                  Navigator.pop(context);
                                                },),
                                              ),
                                              SizedBox(width: 10,),
                                              Flexible(
                                                child: CustomButton(buttonText: Strings.send,
                                                onTap: (){},),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          buttonText: Strings.reject)),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                      child: CustomButton(
                          onTap: () {}, buttonText: Strings.accept))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static int calculateTimeDifferenceBetween(
      {required DateTime startDate, required DateTime endDate}) {
    return startDate.difference(endDate).inHours;
  }
}
