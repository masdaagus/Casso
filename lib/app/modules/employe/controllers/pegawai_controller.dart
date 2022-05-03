import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:get/get.dart';

class EmployeController extends GetxController {
  final auth = Get.find<AuthController>();

  var user = UsersModel().obs;
  var resto = RestosModel().obs;

  List<UsersModel> employes = [];

  Future<void> _initData() async {
    employes = resto.value.restoEmploye as List<UsersModel>;
  }

  List<String> images = [
    "assets/images/head_people.jpeg",
    "assets/images/avatar-2.png",
    "assets/images/avatar-3.png",
    "assets/images/avatar-1.png",
    "assets/images/avatar-4.png",
  ];

  @override
  void onInit() async {
    user = auth.user;
    resto = auth.resto;
    await _initData();
    super.onInit();
  }

  @override
  void onClose() {}
}
