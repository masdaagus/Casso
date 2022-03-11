import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:get/get.dart';

class PegawaiController extends GetxController {
  final auth = Get.find<AuthController>();

  UsersModel user = UsersModel();
  RestosModel resto = RestosModel();

  List<String> images = [
    "assets/images/avatar-2.png",
    "assets/images/avatar-3.png",
    "assets/images/avatar-1.png",
    "assets/images/avatar-4.png",
  ];

  @override
  void onInit() {
    user = auth.user.value;
    resto = auth.resto.value;
    super.onInit();
  }

  @override
  void onClose() {}
}
