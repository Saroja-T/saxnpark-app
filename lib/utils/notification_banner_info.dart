import 'package:flutter/material.dart';

import 'colors.dart';
import 'constants.dart';
import 'styles.dart';

class NotificationBannerInfo extends StatelessWidget {
  final String message;
  final String buttonText;
  final bool isCancelAvailable;
  final Function() onCancel;
  final bool isErrorMsg;

  const NotificationBannerInfo({
    super.key,
    required this.message,
    required this.buttonText,
    required this.isCancelAvailable,
    required this.onCancel,
    required this.isErrorMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(41, 170, 243, 0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex:  2,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child:  Image.asset(
                      info,
                      width: 20,
                      height: 20,
                      color: AppColors.blue3,
                    ),
            ),
          ),
          Flexible(
            flex: isCancelAvailable ? 11 : 9,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                text: TextSpan(
                  style:
                      customTextStyle(14, FontWeight.w400, AppColors.grey10, 1),
                  children: <TextSpan>[
                    TextSpan(text: message),
                    TextSpan(
                        text: buttonText,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blue3)),
                  ],
                ),
              ),
            ),
          ),
          if (isCancelAvailable)
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                child: Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: onCancel,
                      child: const Icon(
                        Icons.cancel_outlined,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (isCancelAvailable)
            const SizedBox(
                width: 15.0), // Padding for the right side of the cancel icon
        ],
      ),
    );
  }
}
