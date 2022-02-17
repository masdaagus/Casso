import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _curentUser;
  UserCredential? userCredential;
  var user = UsersModel().obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// HANDLE SIGN IN
  Future<bool> _sign() async {
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.signIn().then((value) => _curentUser = value);

      final isSignIn = await _googleSignIn.isSignedIn();
      print("sudah login dengan akun google");

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
            "createAt":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
          });
        }

        // memasukkan data baru ke dalam model (agar bisa ditampilkan ke widget)
        final userDoc = await users.doc(_curentUser!.email).get();
        final userDocData = userDoc.data() as Map<String, dynamic>;
        user(UsersModel.fromJson(userDocData));
        user.refresh();

        // kalau semua berhasil akan ke home page

        print("RESTO ID");
        print(user.value.restoID);
        print("email ${user.value.email}");

        /// CEK USER APAKAH SUDAH PUNYA ID RESTO ATAU BELUM
        await user.value.restoID == null
            ? Get.offAllNamed('/introduction')
            : Get.offAllNamed('/home');

        // kalo user suah ke home otomatis user telah mengisi nama resto
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

        print("resto ID = ${user.value.restoID}");
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  /// INITIALIZED PERTAMA APAKAH SUDAH LOGIN DI MAIN FILE
  Future<void> firstInitialzed() async {
    await autoLogin().then((val) => val ? isAuth.value = true : null);
  }

  /// LOGIN FUNGSI
  void login() async {
    await _sign();
  }

  /// LOGOUT
  void logout() async {
    _googleSignIn.signOut();
    _googleSignIn.disconnect();
    Get.offAllNamed('/login');
  }
}
