import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:casso/app/utils/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var user = UsersModel().obs;
  var resto = RestosModel().obs;
  var isSkipIntro = false.obs;
  var isAuth = false.obs;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _curentUser;
  UserCredential? userCredential;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// AUTO LOGIN
  Future<bool> autoLogin() async {
    await Future.delayed(Duration(seconds: 0));
    try {
      try {
        final box = GetStorage();
        final email = box.read("email");
        final password = box.read("password");

        CollectionReference users = firestore.collection("users");
        CollectionReference restos = firestore.collection("restos");
        final userDoc = await users.doc(email).get();
        final userData = userDoc.data() as Map<String, dynamic>;
        final restoDoc = await restos.doc(user.value.restoID).get();
        final restoData = restoDoc.data() as Map<String, dynamic>;

        if (email == userData['name'] && password == userData['password']) {
          user(UsersModel.fromJson(userData));
          user.refresh();

          resto(RestosModel.fromJson(restoData));
          resto.refresh();

          isAuth.value = true;

          Get.offAllNamed('/home');

          print("BERHASIL AUTO LOGIN DENGAN EMPLOYE");
        }
      } catch (e) {}
      final isSign = await _googleSignIn.isSignedIn();
      if (isSign) {
        await _googleSignIn
            .signInSilently()
            .then((value) => _curentUser = value);
        final googleAuth = await _curentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        CollectionReference users = firestore.collection('users');
        final userDoc = await users.doc(_curentUser!.email).get();
        final userDocData = userDoc.data() as Map<String, dynamic>;
        user(UsersModel.fromJson(userDocData));
        user.refresh();

        /// memasukkan data ke dalam model(agar bisa di tampilakn di widget)
        CollectionReference restos = firestore.collection("restos");
        final restoId = await restos.doc(user.value.restoID).get();
        final restoData = restoId.data() as Map<String, dynamic>;
        resto(RestosModel.fromJson(restoData));
        resto.refresh();

        /// CEK USER APAKAH SUDAH PUNYA ID RESTO ATAU BELUM
        await user.value.restoID != null ? isAuth.value = true : null;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  /// LOGIN LOGIN WITH GOOGLE
  Future<bool> loginWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.signIn().then((value) => _curentUser = value);

      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        // MEMBUAT USER CREDENTIAL UNTUK CONNECT KE AUTENTIKASI
        final googleAuth = await _curentUser!.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);
        print("USER CREDENTIAL DARI LOGIN = ");
        print(userCredential);

        /// MEMASUKKAN DATA KE FIREBASE
        CollectionReference users = firestore.collection("users");

        final checkUser = await users.doc(_curentUser!.email).get();

        if (checkUser.data() == null) {
          // menambahkan data baru kalau data null
          await users.doc(_curentUser!.email).set({
            "uid": userCredential!.user!.uid,
            "name": _curentUser!.displayName,
            "email": _curentUser!.email,
            "status": "OWNER",
            "restoID": null,
          });
        }

        // memasukkan data user ke dalam model (agar bisa ditampilkan ke widget)
        final userDoc = await users.doc(_curentUser!.email).get();
        final userDocData = userDoc.data() as Map<String, dynamic>;
        user(UsersModel.fromJson(userDocData));
        user.refresh();

        /// CEK USER APAKAH SUDAH PUNYA ID RESTO ATAU BELUM
        await user.value.restoID == null
            ? Get.offAllNamed('/introduction')
            : Get.offAllNamed('/home');
        user.refresh();

        isAuth.value = true;
        // kalo user sudah ke home otomatis user telah mengisi nama resto
      }
      return true;
    } catch (error) {
      print("error nih =  $error");
      print("error nih =  ${_curentUser!.email}");
      return false;
    }
  }

  /// LOGOUT
  void logout() async {
    Get.to(SplashScreen());
    final box = GetStorage();
    box.remove("email");
    box.remove("password");
    _googleSignIn.signOut();
    _googleSignIn.disconnect();
    await Future.delayed(Duration(seconds: 2));
    Get.offAllNamed('/login');
  }

  /// LOGIN WITH USERS EMPLOYE
  Future<bool> loginEmploye(String email, password) async {
    try {
      Get.to(SplashScreen());
      CollectionReference users = firestore.collection("users");

      final userDoc = await users.doc(email).get();
      final userData = userDoc.data() as Map<String, dynamic>;

      if (email == userData['name'] && password == userData['password']) {
        user(UsersModel.fromJson(userData));
        user.refresh();

        // simpan status user bahwa sudah pernah login
        final box = GetStorage();
        if (box.read("email") != null && box.read("password") != null) {
          box.remove("email");
          box.remove("password");
        }
        box.write("email", email);
        box.write("password", password);

        isAuth.value = true;
        await Future.delayed(Duration(seconds: 2));
        Get.offAllNamed('/home');

        print("BERHASIL LOGIN EMPLOYE");
        return true;
      } else {
        print("gagal login");
        return false;
      }
    } catch (e) {
      print(e);
      print("LOGIN GAGAL");
      return false;
    }
  }
}
