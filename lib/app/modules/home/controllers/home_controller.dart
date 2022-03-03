import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final auth = Get.put(AuthController());

  UsersModel user = UsersModel();
  RestosModel resto = RestosModel();
  @override
  void onInit() {
    user = auth.user.value;
    resto = auth.resto.value;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
