import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:casso/app/modules/login/controllers/login_controller.dart';
import 'package:casso/app/modules/login/views/login_view.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:casso/app/utils/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
    try {
      /// LOGIN DENGAN ACCOUNT

      try {
        final box = GetStorage();
        String email = box.read(emailKey);
        String password = box.read(passwordKey);
        if (email.isNotEmpty) {
          CollectionReference users = firestore.collection("users");
          final userDoc = await users.doc(email).get();
          final userData = userDoc.data() as Map<String, dynamic>;
          user(UsersModel.fromJson(userData));
          user.refresh();

          if (email == user.value.email && password == user.value.password) {
            CollectionReference restos = firestore.collection("restos");
            final restoDoc = await restos.doc(user.value.restoID).get();
            final restoData = restoDoc.data() as Map<String, dynamic>;
            resto(RestosModel.fromJson(restoData));
            resto.refresh();

            isAuth.value = true;

            Get.offAllNamed('/home');

            print("BERHASIL AUTO LOGIN DENGAN EMPLOYE");
          }
        }
      } catch (e) {
        print(e);
      }

      /// LOGINN DENGAN GOOGLE
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

  /// REGISTER WITH EMAIL AND PASSWORD
  Future<bool> register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: 'masdacoc@gmail.com', password: "123456");
    } catch (e) {
      print(e);
    }
    return true;
  }

  /// LOGIN LOGIN WITH GOOGLE
  Future<bool> loginWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.signIn().then((value) {
        Get.to(() => SplashScreen());
        _curentUser = value;
      });

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

        /// MEMASUKKAN DATA KE FIREBASE
        CollectionReference users = firestore.collection("users");

        final checkUser = await users.doc(_curentUser!.email).get();

        if (checkUser.data() == null) {
          await users.doc(_curentUser!.email).set(
                UsersModel(
                  uid: userCredential!.user!.uid,
                  name: _curentUser!.displayName,
                  email: _curentUser!.email,
                  status: "OWNER",
                  restoID: null,
                  password: "123456",
                ).toJson(),
              );
        }

        // memasukkan data user ke dalam model (agar bisa ditampilkan ke widget)
        final userDoc = await users.doc(_curentUser!.email).get();
        final userDocData = userDoc.data() as Map<String, dynamic>;
        user(UsersModel.fromJson(userDocData));
        user.refresh();

        /// CEK USER APAKAH SUDAH PUNYA ID RESTO ATAU BELUM
        // await user.value.restoID == null
        //     ? Get.offAllNamed('/introduction')
        //     : Get.offAllNamed('/home');

        if (user.value.restoID == null) {
          Get.offAllNamed('/introduction');
        } else {
          CollectionReference restos = firestore.collection("restos");
          final restoId = await restos.doc(user.value.restoID).get();
          final restoData = restoId.data() as Map<String, dynamic>;
          resto(RestosModel.fromJson(restoData));
          resto.refresh();
          user.refresh();

          isAuth.value = true;
          Get.offAllNamed('/home');
        }

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
  Future<void> logout() async {
    Get.to(SplashScreen());
    final box = GetStorage();
    box.remove("email");
    box.remove("password");
    _googleSignIn.signOut();
    _googleSignIn.disconnect();
    await FirebaseMessaging.instance.unsubscribeFromTopic(user.value.restoID!);
    isAuth.value = false;
    Get.put(LoginController());
    Get.to(() => LoginView());
  }

  /// LOGIN WITH USERS EMPLOYE
  Future<bool> loginEmploye(String email, String password) async {
    try {
      CollectionReference users = firestore.collection("users");

      final userDoc = await users.doc(email).get();
      final userData = userDoc.data() as Map<String, dynamic>;
      await user(UsersModel.fromJson(userData));
      user.refresh();

      if (email == userData['email'] && password == userData['password']) {
        Get.to(SplashScreen());

        CollectionReference restos = firestore.collection("restos");
        final restoDoc = await restos.doc(user.value.restoID).get();
        final restoData = restoDoc.data() as Map<String, dynamic>;
        resto(RestosModel.fromJson(restoData));
        resto.refresh();
        // simpan status user bahwa sudah pernah login
        final box = GetStorage();
        if (box.read(emailKey) != null && box.read(passwordKey) != null) {
          box.remove(emailKey);
          box.remove(passwordKey);
        }
        await box.write(emailKey, email);
        await box.write(passwordKey, password);

        isAuth.value = true;
        Get.offAllNamed('/home');
        print("BERHASIL LOGIN EMPLOYE");
      }
      return true;
    } catch (e) {
      print(e);
      print("LOGIN GAGAL");
      return false;
    }
  }
}
