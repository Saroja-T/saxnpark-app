import 'package:flutter/material.dart';
import 'package:saxnpark_app/bottomsheets/location_details.dart';
import 'package:saxnpark_app/pages/landing_page.dart';
import 'package:saxnpark_app/utils/colors.dart';
import 'package:saxnpark_app/utils/custom_widgets.dart';
import 'package:saxnpark_app/utils/strings.dart';
import 'package:saxnpark_app/utils/styles.dart';

showMylocationsBottomSheet(context) {
  bool starSelected = false;
  controller = scaffoldKey.currentState!.showBottomSheet((_) => Container(child:
          StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
        return SizedBox(
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
                  padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
                  child: Container(
                      child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white)),
                            onPressed: () {},
                            child: Text(
                              Strings.recent,
                              style: customTextStyle(
                                  14, FontWeight.w400, AppColors.black6, 1),
                            )),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.black6)),
                            onPressed: () {},
                            child: Text(
                              "Near",
                              style: customTextStyle(
                                  14, FontWeight.w600, AppColors.white, 1),
                            )),
                      )
                    ],
                  )),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: ListView.separated(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(onTap: () {
                          // context.read<LandingBloc>().add(TabChangeEvent(
                          //     tabIndex: 0, tabLabel: Strings.location));
                          print("clicked");
                        }, child: LocationCards(
                          btnClick: () {
                            showLocationBottomSheet(context, starSelected);
                          },
                          isParkAgain: false,
                        ));
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      })));
}
