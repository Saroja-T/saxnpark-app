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
  static Color black6 =  convertToHex("#1E1E1E");
  static Color black7 =  convertToHex("#1E222B");

  
  //Blue
  static Color blue1 = convertToHex("#1980E0");
  static Color blue4 = convertToHex("#e6f7ff");

  //Grey
  static Color grey = convertToHex("#767676");
  static Color gray1 = convertToHex("#767676");
  static Color grey1 = convertToHex("#EFEFEF");
  static Color grey2 = convertToHex("#606060");
  static Color grey3 = convertToHex("#EBEDEE");
  static Color grey4 = convertToHex("#F1F1F1");
  static Color grey5 = convertToHex("#e6e6e6");
  static Color grey6 = convertToHex("#6b6b6b");
  static Color grey7 = convertToHex("#858585");
  static Color grey8 = convertToHex("#adadad");
  static Color grey9 = convertToHex("#d6d6d6");
  static Color grey10 = convertToHex("#858585");
  static Color grey11 = convertToHex("#FDFDFD");
  static Color grey12 = convertToHex("#DDDCDC");

  



  //red
  static Color red1 = convertToHex("#eb4d4d");

  //green
  static Color green1 = convertToHex("#4deb9f");  
 

   static Color convertToHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}