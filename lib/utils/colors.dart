import 'dart:ui';

class AppColors{
  static Color primary = const Color(0xff24CF7D);
  static Color toolbarShadow = const Color.fromRGBO(0, 0, 0, 0.3);

  //White
 static Color white =  convertToHex("#ffffff");

  // Black
  static Color black1 =  convertToHex("#1E222B");
  static Color black2 =  convertToHex("#262323");
  static Color black3 =  convertToHex("#333333");
  static Color black4 =  convertToHex("#6B6B6B");
  static Color black5 =  convertToHex("#2E2E2E");
  
  //Blue
  static Color blue1 = convertToHex("#1980E0");

  //Grey
  static Color grey1 = convertToHex("#EFEFEF");
  static Color grey2 = convertToHex("#606060");
  static Color grey3 = convertToHex("#EBEDEE");
  static Color grey4 = convertToHex("#F1F1F1");
  static Color grey5 = convertToHex("#e6e6e6");
  
 

   static Color convertToHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}