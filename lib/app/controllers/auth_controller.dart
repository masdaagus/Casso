import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _curentUser;
  UserCredential? userCredential;

  get user => _curentUser;

  Future<void> _handleSignIn() async {
    try {
      // await _googleSignIn.signOut();
      await _googleSignIn.signIn().then((value) => _curentUser = value);

      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        final googleAuth = await _curentUser!.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        final box = GetStorage();
        box.write("skipIntro", true);

        Get.offAllNamed('/home');
      }
    } catch (error) {
      print(error);
    }
  }

  Future<bool> _autoLogin() async {
    try {
      final isSign = await _googleSignIn.isSignedIn();
      if (isSign == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> _isSkipIntro() async {
    final box = GetStorage();
    final value = box.read("skipIntro");
    if (value != null || value == true) {
      return true;
    } else {
      return false;
    }
    ;
  }

  Future<void> firstInitialzed() async {
    await _autoLogin().then((v) => v ? isAuth.value = true : null);
    await _isSkipIntro().then((v) => v ? isSkipIntro.value = true : null);
  }

  void login() async {
    _handleSignIn();
  }

  void logout() async {
    _googleSignIn.signOut();
    _googleSignIn.disconnect();
    Get.offAllNamed('/login');
  }
}
