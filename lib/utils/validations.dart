
class Validations
{
  bool validatePassword(String value){
     String pattern = r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
   bool isValidEmail(String email) {
    // Simple email validation using regular expression
    // This regex pattern may not cover all cases, consider using a more comprehensive pattern for production
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}