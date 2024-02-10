import 'package:flutter/material.dart';

import 'colors.dart';
import 'strings.dart';

class CurvedDialog extends StatelessWidget {
  final String title;
  final bool isTitleAvailable;
  final String content;
  final String yesBtnText;
  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;

  const CurvedDialog({
    super.key,
    required this.title,
    required this.isTitleAvailable,
    required this.content,
    required this.yesBtnText,
    required this.onYesPressed,
    required this.onNoPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double dialogWidth = MediaQuery.of(context).size.width * 0.7;
    final double dialogHeight = MediaQuery.of(context).size.height * 0.2;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.white, // Set the background color to white
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: dialogWidth,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(isTitleAvailable)
              Text(
                title,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black6),
              ),
              if(isTitleAvailable)
              const SizedBox(height: 10),
              Text(
                content,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black6),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(dialogWidth * 0.4, dialogHeight*0.25),
                      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(color: Color.fromRGBO(30, 30, 30, 1)),
                      ),
                    ),
                    onPressed: onNoPressed,
                    child: Text(Strings.cancel,
                        style: TextStyle(
                            color: AppColors.black6,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(dialogWidth * 0.4, dialogHeight*0.25), // Adjust button width
                      backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(color: Color.fromRGBO(30, 30, 30, 1)),
                      ),
                    ),
                    onPressed: onYesPressed,
                    child: Text(yesBtnText,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
