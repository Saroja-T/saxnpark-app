import 'package:flutter/material.dart';
import 'package:saxnpark_app/utils/constants.dart';
import 'colors.dart';

final ButtonStyle borderedButtonStyle = ElevatedButton.styleFrom(
  minimumSize: const Size(double.infinity, 51),
  backgroundColor: AppColors.primary,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
);
final ButtonStyle homeActiveElatedBtnStyle = ElevatedButton.styleFrom(
  backgroundColor: AppColors.black1,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
);
final ButtonStyle homeInActiveElatedBtnStyle = ElevatedButton.styleFrom(
  backgroundColor: AppColors.grey3,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
);

final ButtonStyle locationActiveElatedBtnStyle = ElevatedButton.styleFrom(
  minimumSize: const Size(double.infinity, 51),
  backgroundColor: AppColors.grey4,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
);

final ButtonStyle locationInActiveElatedBtnStyle = TextButton.styleFrom(
  minimumSize: const Size(double.infinity, 51),
  backgroundColor: AppColors.grey4,
  side: BorderSide(color: AppColors.grey5,style: BorderStyle.solid),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
);



TextStyle customTextStyle(double size,FontWeight weight,Color color,double dHeight){
    final TextStyle textStyle  = TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
      height: dHeight
    );
    return textStyle;
}