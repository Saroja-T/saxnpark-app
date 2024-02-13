import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saxnpark_app/utils/constants.dart';
import 'package:saxnpark_app/utils/strings.dart';
import 'package:saxnpark_app/utils/styles.dart';

import 'colors.dart';

Widget customAppBarWidget(name) {
  return AppBar(
      backgroundColor: Colors.white,
      shadowColor: AppColors.toolbarShadow,
      title: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          name,
          style: TextStyle(
              color: AppColors.black2,
              fontSize: 12.0,
              fontWeight: FontWeight.w600),
        ),
      ));
}

class LocationCards extends StatelessWidget {
  LocationCards({Key? key, required this.btnClick, required this.isParkAgain})
      : super(key: key);
  final Function() btnClick;
  final bool isParkAgain;

  @override
  Widget build(BuildContext context) {
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
                          16.0, FontWeight.w500, AppColors.black3, 0)),
                  SizedBox(width: 3),
                  InkWell(onTap: btnClick, child: Image.asset(info))
                ],
              ),
              Image.asset(star)
            ],
          ),
          Text("5km away",
              style:
                  customTextStyle(14.0, FontWeight.w400, AppColors.blue1, 1.5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Strings.weekDayText,
                  style: customTextStyle(
                      13.0, FontWeight.w400, AppColors.black3, 1.5)),
              Text("09:00 - 22:00",
                  style: customTextStyle(
                      13.0, FontWeight.w600, AppColors.black3, 1.5)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Strings.weekEndText,
                  style: customTextStyle(
                      13.0, FontWeight.w400, AppColors.black3, 1.5)),
              Text("11:00 - 18:00",
                  style: customTextStyle(
                      13.0, FontWeight.w600, AppColors.black3, 1.5)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Strings.weekEndText,
                  style: customTextStyle(
                      13.0, FontWeight.w400, AppColors.black3, 1.5)),
              Text("FREE",
                  style: customTextStyle(
                      13.0, FontWeight.w600, AppColors.black3, 1.5)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Strings.timeFrequencyText,
                  style: customTextStyle(
                      10.0, FontWeight.w400, AppColors.gray1, 1.5)),
              Text('\$0.14',
                  style: customTextStyle(
                      10.0, FontWeight.w600, AppColors.black3, 1.5)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Strings.oneHourText,
                  style: customTextStyle(
                      10.0, FontWeight.w400, AppColors.gray1, 1.5)),
              Text("\$1.40",
                  style: customTextStyle(
                      10.0, FontWeight.w600, AppColors.black3, 1.5)),
            ],
          ),
          if (isParkAgain)
            SizedBox(
              height: 10,
            ),
          if (isParkAgain)
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: AppColors.black6)),
              child: Center(
                child: Text(
                  Strings.parkAgain,
                  style:
                      customTextStyle(14, FontWeight.w700, AppColors.black6, 0),
                ),
              ),
            ),
          if (isParkAgain)
            SizedBox(
              height: 10,
            ),
        ],
      ),
    );
  }
}

Future<void> showPositiveToast(toastText) {
  return Fluttertoast.showToast(
      msg: toastText,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

Future<void> showNegativeToast(toastText) {
  return Fluttertoast.showToast(
      msg: toastText,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

showLocationDisabledAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(Strings.cancel),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text(Strings.openSettings),
    onPressed: () {
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

Widget arrowDownIcon() {
  return Row(
    children: [
      const SizedBox(
        width: 4,
      ),
      Icon(Icons.keyboard_arrow_down_outlined,
          size: 18, color: AppColors.black6),
      const SizedBox(
        width: 4,
      ),
    ],
  );
}

Widget countryImageIcon(imageData) {
  return Image.asset(
    imageData,
    width: 16,
    height: 16,
  );
}

Widget driverAccountCreationLabel(labelName, h) {
  return Column(
    children: [
      verticalSizedWidget29(h),
      Text(
        labelName,
        style: customTextStyle(16, FontWeight.w400, AppColors.black1, 1),
      ),
      verticalSizedWidget10(h)
    ],
  );
}

verticalSizedWidget29(height) {
  return SizedBox(
    height: (height! * 0.035).ceilToDouble(),
  );
}

verticalSizedWidget10(height) {
  return SizedBox(
    height: (height! * 0.012).ceilToDouble(),
  );
}

verticalSizedWidget5(height) {
  return SizedBox(
    height: (height! * 0.006).ceilToDouble(),
  );
}

Widget errorWidget(String errorMsg) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              info,
              color: AppColors.red1,
            ),
            SizedBox(
              width: 5,
            ),
            Flexible(
              child: Text(
                errorMsg,
                style: customTextStyle(12, FontWeight.w400, AppColors.red1, 1.2),
              ),
            ),
          ],
        )),
  );
}

Widget passwordRegexHint() {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Padding(
      padding: EdgeInsets.only(top: 8),
      child: RichText(
        text: TextSpan(
          style: customTextStyle(12, FontWeight.w400, AppColors.black5, 1.2),
          children: <TextSpan>[
            TextSpan(text: Strings.passwordError),
            TextSpan(
              text: Strings.passwordError1,
              style:
                  customTextStyle(12, FontWeight.w600, AppColors.black5, 1.2),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget successWidget(String msg) {
  return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.only(bottom: 16),
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color.fromRGBO(41, 170, 243, 0.1)),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset(
        info,
        color: AppColors.black6,
      ),
      const SizedBox(
        width: 4,
      ),
      Flexible(child: Text(msg))
    ]),
  );
}

commonWidget(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: customTextStyle(14, FontWeight.w400, AppColors.black6, 0),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subTitle,
          style: customTextStyle(16, FontWeight.w600, AppColors.black6, 0),
        ),
      ],
    );
  }

  commonWidget1(String title, String subTitle, String subTitle1,bool iconStatus) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            if(iconStatus)
            Image.asset(
              home,
              color: AppColors.black6,
            ),
            if(iconStatus)
            const SizedBox(width: 5,),
            Text(
              title,
              style: customTextStyle(14, FontWeight.w400, AppColors.black6, 0),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              subTitle,
              style:
                  customTextStyle(16, FontWeight.w600, AppColors.black6, 0),
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(
              Icons.circle,
              color: AppColors.black6,
              size: 4,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              subTitle1,
              style:
                  customTextStyle(16, FontWeight.w600, AppColors.black6, 0),
            ),
          ],
        )
      ],
    );
  }

Widget customListRow(String icon, String title, String text1, bool isCircle,
      String text2, bool isChangeble, Function() onChangeFunction, bool isCard) {
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
          if(isCard)
          Image.asset(
            visa
          ),
          if(isCard)
          const SizedBox(
            width: 5,
          ),
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

  Widget customListRow1(String title, String text1) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: customTextStyle(14, FontWeight.w400, AppColors.black6, 0),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text1,
          style: customTextStyle(16, FontWeight.w600, AppColors.black6, 0),
        ),
        const SizedBox(
          height: 16,
        )
      ],
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
          height: 10
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