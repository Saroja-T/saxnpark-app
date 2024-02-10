import 'package:flutter/material.dart';

import '../pages/landing_page.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

showLocationBottomSheet(context, starSelected) {
  controller = scaffoldKey.currentState!.showBottomSheet((_) => Container(
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                    child: Text(Strings.buttonCloseText,
                                        style: TextStyle(
                                            color: AppColors.black5,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    })),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                Strings.carParkTitle,
                                style: TextStyle(
                                    color: AppColors.black2,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.grey4,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                      child: Column(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(Strings.locationDetailTitle,
                                        style: customTextStyle(
                                            18.0,
                                            FontWeight.w600,
                                            AppColors.black1,
                                          1.7)),
                                    InkWell(
                                      child: Image.asset(
                                          starSelected ? selectedStar : star),
                                      onTap: () {
                                        setModalState(() {
                                          starSelected = !starSelected;
                                        });
                                      },
                                    )
                                  ],
                                ),
                                Text(Strings.locationDetailAddress,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.black5,
                                        1.7)),
                                Row(
                                  children: [
                                    Text("${Strings.operatorTitle}: ",
                                        style: customTextStyle(
                                            14.0,
                                            FontWeight.w400,
                                            AppColors.black5,
                                            1.7)),
                                    Text(Strings.operatorText,
                                        style: customTextStyle(
                                            14.0,
                                            FontWeight.w400,
                                            AppColors.black5,
                                            1.7)),
                                  ],
                                ),
                              ]),
                          const SizedBox(
                            height: 12,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Strings.rates,
                                  style: customTextStyle(16.0, FontWeight.w600,
                                      AppColors.black1, 0)),
                              const SizedBox(height: 5),
                              commonRowWidget(Strings.oneHourText, "\$1.40"),
                              commonRowWidget(Strings.thirtyMinText, "\$0.14"),
                              commonRowWidget(Strings.twentyFour, "\$0.14"),
                              commonRowWidget(Strings.oneWeek, "\$0.14"),
                              commonRowWidget(Strings.oneMonth, "\$0.14"),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Strings.aboutLocation,
                                  style: customTextStyle(16.0, FontWeight.w600,
                                      AppColors.black1, 0)),
                              const SizedBox(height: 5),
                              commonRowWidget(
                                  Strings.locType, Strings.carParkText),
                              commonRowWidget(
                                  Strings.parkingCapacity, "200 Spaces"),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            // height: 157,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Strings.policiesText,
                                    style: customTextStyle(16.0,
                                        FontWeight.w600, AppColors.black1, 0)),
                                const SizedBox(height: 5),
                                commonRowWidget(Strings.minimumStay, Strings.temMinText),
                                commonRowWidget(Strings.noReturnwithin, Strings.thirtyMinText),
                                commonRowWidget(Strings.extentable, Strings.extentableText),
                                commonRowWidget(Strings.minCancellationTime, Strings.cancellationText),
                                commonRowWidget(Strings.depGap, Strings.fiveMinText),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Strings.notesText,
                                  style: customTextStyle(16.0, FontWeight.w600,
                                      AppColors.black1, 0)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(Strings.anyAdditionalInfo,
                                      style: customTextStyle(
                                          14.0,
                                          FontWeight.w400,
                                          AppColors.black5,
                                          1.5)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Strings.contactDetails,
                                  style: customTextStyle(16.0, FontWeight.w600,
                                      AppColors.black1, 0)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(Strings.emailPhone,
                                      style: customTextStyle(
                                          14.0,
                                          FontWeight.w400,
                                          AppColors.black5,
                                          1.5)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ));
}

commonRowWidget(String title, String subTitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,
          style: customTextStyle(14.0, FontWeight.w400, AppColors.black5, 1.5)),
      Text(subTitle,
          style: customTextStyle(14.0, FontWeight.w600, AppColors.black5, 1.6)),
    ],
  );
}
