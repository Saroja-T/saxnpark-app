

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saxnpark_app/utils/constants.dart';
import 'package:saxnpark_app/utils/strings.dart';
import 'package:saxnpark_app/utils/styles.dart';

import 'colors.dart';


Widget customAppBarWidget(name){
  return AppBar(
        backgroundColor: Colors.white,
        shadowColor: AppColors.toolbarShadow,
        title: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            name,
          style: TextStyle(
            color: AppColors.black2,fontSize: 12.0,fontWeight: FontWeight.w600),),
        ));
}



class LocationCards extends StatelessWidget {
  const LocationCards({Key? key,required this.btnClick}) : super(key:key);
  final Function() btnClick;

  @override
  Widget build(BuildContext context) 
  {
    return Container(
                        // height: 157,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(Strings.carParkName,
                                        style: customTextStyle(
                                            16.0,
                                            FontWeight.w500,
                                            AppColors.black3,
                                            0)),
                                    SizedBox(width: 3),
                                    InkWell(
                                      onTap: btnClick,
                                      child: Image.asset(info))
                                  ],
                                ),
                                Image.asset(star)
                              ],
                            ),
                            Text("5km away",
                                style: customTextStyle(14.0, FontWeight.w400,
                                    AppColors.blue1, 1.5)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.weekDayText,
                                    style: customTextStyle(
                                        13.0,
                                        FontWeight.w400,
                                        AppColors.black3,
                                        1.5)),
                                Text("09:00 - 22:00",
                                    style: customTextStyle(
                                        13.0,
                                        FontWeight.w600,
                                        AppColors.black3,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.weekEndText,
                                    style: customTextStyle(
                                        13.0,
                                        FontWeight.w400,
                                        AppColors.black3,
                                        1.5)),
                                Text("11:00 - 18:00",
                                    style: customTextStyle(
                                        13.0,
                                        FontWeight.w600,
                                        AppColors.black3,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.weekEndText,
                                    style: customTextStyle(
                                        13.0,
                                        FontWeight.w400,
                                        AppColors.black3,
                                        1.5)),
                                Text("FREE",
                                    style: customTextStyle(
                                        13.0,
                                        FontWeight.w600,
                                        AppColors.black3,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.timeFrequencyText,
                                    style: customTextStyle(10.0,
                                        FontWeight.w400, AppColors.gray1, 1.5)),
                                Text('\$0.14',
                                    style: customTextStyle(
                                        10.0,
                                        FontWeight.w600,
                                        AppColors.black3,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.oneHourText,
                                    style: customTextStyle(10.0,
                                        FontWeight.w400, AppColors.gray1, 1.5)),
                                Text("\$1.40",
                                    style: customTextStyle(
                                        10.0,
                                        FontWeight.w600,
                                        AppColors.black3,
                                        1.5)),
                              ],
                            )
                          ],
                        ),
                      );
  }
}

Future<void> showPositiveToast(toastText) 
{
  return
   Fluttertoast.showToast(
        msg: toastText,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
}

Future<void> showNegativeToast(toastText) 
{
  return
   Fluttertoast.showToast(
        msg: toastText,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
}

showLocationDisabledAlertDialog(BuildContext context) 
{
  // set up the buttons
  Widget cancelButton = TextButton(
    child:  Text(Strings.cancel),
    onPressed:  () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child:  Text(Strings.openSettings),
    onPressed:  () {
      Navigator.pop(context);
      openAppSettings();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(Strings.attention),
    content: Text(Strings.locationEnableMessage),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



