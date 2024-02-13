import 'package:flutter/material.dart';

import '../colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color:  AppColors.black6, // Change to your desired color
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white, // Change to your desired color
            ),
          ),
        ),
      ),
    );
  }
}
