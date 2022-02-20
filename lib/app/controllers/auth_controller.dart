import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var user = UsersModel().obs;
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _curentUser;
  UserCredential? userCredential;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// HANDLE SIGN IN
  Future<bool> _sign() async {
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

        // memasukkan data baru ke dalam model (agar bisa ditampilkan ke widget)
        final userDoc = await users.doc(_curentUser!.email).get();
        final userDocData = userDoc.data() as Map<String, dynamic>;
        user(UsersModel.fromJson(userDocData));
        user.refresh();

        print("RESTO ID");
        print(user.value.restoID);
        print("email ${user.value.email}");

        /// CEK USER APAKAH SUDAH PUNYA ID RESTO ATAU BELUM
        await user.value.restoID == null
            ? Get.offAllNamed('/introduction')
            : Get.offAllNamed('/home');

        // kalo user sudah ke home otomatis user telah mengisi nama resto
        user.refresh();
        isAuth.value = true;
      }
      return true;
    } catch (error) {
      print("error nih =  $error");
      print("error nih =  ${_curentUser!.email}");
      return false;
    }
  }

  /// AUTO LOGIN
  Future<bool> autoLogin() async {
    try {
      // try {
      final box = GetStorage();
      final email = box.read("email");
      final password = box.read("password");
      CollectionReference users = firestore.collection("users");

      final userDoc = await users.doc(email).get();
      final userData = userDoc.data() as Map<String, dynamic>;

      if (email == userData['name'] && password == userData['password']) {
        user(UsersModel.fromJson(userData));
        user.refresh();
        isAuth.value = true;

        Get.offAllNamed('/home');

        print("BERHASIL AUTO LOGIN DENGAN EMPLOYE");
      }
      // } catch (e) {}
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

        print("USER CREDENTIAL DARI AUTO LOGIN = ");
        print(userCredential);

        CollectionReference users = firestore.collection('users');

        final userDoc = await users.doc(_curentUser!.email).get();
        final userDocData = userDoc.data() as Map<String, dynamic>;

        print("user doc = $userDoc");
        print("userDoc data = $userDocData");

        user(UsersModel.fromJson(userDocData));
        user.refresh();

        /// CEK USER APAKAH SUDAH PUNYA ID RESTO ATAU BELUM
        await user.value.restoID != null ? isAuth.value = true : null;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  /// LOGIN LOGIN WITH GOOGLE
  void loginWithGoogle() async {
    await _sign();
  }

  /// LOGOUT
  void logout() async {
    final box = GetStorage();
    box.remove("email");
    box.remove("password");
    _googleSignIn.signOut();
    _googleSignIn.disconnect();
    Get.offAllNamed('/login');
  }

  /// LOGIN WITH USERS EMPLOYE
  Future<bool> loginEmploye(String email, password) async {
    try {
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

  // Future<bool> loginWithEmail(String email, password) async {
  //   // Prompt the user to enter their email and password
  //   // String email = 'masdacoc@gmail.com';
  //   // String password = '123456';

  //   try {
  //     // await FirebaseAuth.instance
  //     //     .signInWithEmailAndPassword(
  //     //       email: "masdacoc@gmail.com",
  //     //       password: "123456",
  //     //     )
  //     //     .then((value) => userCredential = value);

  //     // await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     //     email: "masdacoc@gmail.com", password: "a06176258262");
  //     // Get.offAllNamed('/home');
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }
}
