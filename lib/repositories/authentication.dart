

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:saxnpark_app/models/login_model.dart';

import '../exceptions/authentication_exception.dart';
import '../models/custom_error.dart';
import '../services/authentication_service.dart';

class AuthRepository {
   final AuthenticationApiServices authenticationApiServices;
  AuthRepository({
    required this.authenticationApiServices,
  });

  Future<void> signOutWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: [
          'email'
        ]
      ).signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authResult.user;
      print(user);
      return user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<LoginModel> logIn(String phoneNumber,String password) async {
    try {
     
      final LoginModel weather = await authenticationApiServices.postLogin(phoneNumber,password);
      print('weather: $weather');

      return weather;
    } on AuthenticationException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
