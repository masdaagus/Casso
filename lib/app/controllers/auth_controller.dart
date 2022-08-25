import 'package:casso/app/services/auth/auth_service.dart';
import 'package:casso/app/utils/splash_screen.dart';
import 'package:get/get.dart';
import '../data/model/user_model.dart';

class AuthController extends GetxController {
  var user = UserModel().obs;
  var isAuth = false.obs;

  final AuthentivicationService _authService = AuthentivicationService();

  /// AUTO LOGIN
  Future<bool> autoLogin() async {
    final _token = await _authService.getToken();
    final userModel = UserModel(uid: _token);
    bool isLogin = await _authService.autoLogin();
    isAuth.value = isLogin;
    user(userModel);
    user.refresh();
    return isAuth.value;
  }

  /// LOGIN LOGIN WITH GOOGLE
  Future<UserModel> loginWithGoogle() async {
    UserModel userModel = await _authService.loginWithGoogle();

    if (userModel.uid != null) {
      isAuth.value = true;
      user(userModel);
      user.refresh();
    }
    return userModel;
  }

  /// LOGOUT
  Future<void> logout() async {
    Get.to(SplashScreen());
    await _authService.logout();
    isAuth.value = false;
  }
}
