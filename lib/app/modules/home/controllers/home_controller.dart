import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final auth = Get.find<AuthController>();

  UsersModel user = UsersModel();
  @override
  void onInit() {
    user = auth.user.value;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
