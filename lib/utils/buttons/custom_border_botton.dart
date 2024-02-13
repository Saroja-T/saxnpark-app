import 'package:flutter/material.dart';

import '../colors.dart';

class CustomBorderButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;

  const CustomBorderButton({
    Key? key,
    required this.onTap,
    required this.buttonText,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: AppColors.black6),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.black6,
            ),
          ),
        ),
      ),
    );
  }
}
