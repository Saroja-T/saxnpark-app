import 'package:flutter/material.dart';

import 'colors.dart';
import 'constants.dart';

class NotificationBanner extends StatelessWidget {
  final String message;
  final bool isCancelAvailable;
  final Function() onCancel;
  final bool isErrorMsg;

  const NotificationBanner({
    super.key,
    required this.message,
    required this.isCancelAvailable,
    required this.onCancel, required this.isErrorMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: !isErrorMsg?const Color.fromRGBO(36, 207, 125, 0.1): const Color.fromRGBO(235, 77, 77, 0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: !isErrorMsg?1:2,
            child: Padding(
              padding: const EdgeInsets.only(left: 15,top: 3),
              child: !isErrorMsg
                  ? const Icon(
                      Icons.check_circle_outline,
                      size: 16,
                      color: Color.fromRGBO(36, 207, 125, 1),
                    )
                  : Image.asset(
                      info,
                      width: 20,
                      height: 20,
                      color: AppColors.red1,
                    ),
            ),
          ),
          Flexible(
            flex: isCancelAvailable ? 11 : 9,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                message,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          if (isCancelAvailable)
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,3,0,0),
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
