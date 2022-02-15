import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  var user = UsersModel().obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// HANDLE SIGN IN
  Future<bool> _handleSignIn() async {
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

        /// MENYIMPAN DATA BAHWA PERNAH LOGIN UNTUK TIDAK MENAMPILKAN INTRODUCING SCREEN LAGI
        final box = GetStorage();
        if (box.read('skipIntro') != null) {
          box.remove('skipIntro');
        }
        box.write('skipIntro', true);

        print("value skip intro = ${box.read("skipIntro")}");

        /// MEMASUKKAN DATA KE FIREBASE
        CollectionReference users = firestore.collection("users");

        final checkUser = await users.doc(_curentUser!.email).get();

        if (checkUser.data() == null) {
          // menambahkan data baru kalau data null
          await users.doc(_curentUser!.email).set({
            "name": _curentUser!.displayName,
            "email": _curentUser!.email,
            "status": "nanti di update",
            "createAt":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
          });
        }

        // memasukkan data baru ke dalam model (agar bisa ditampilkan ke widget)
        final userDoc = await users.doc(_curentUser!.email).get();
        final userDocData = userDoc.data() as Map<String, dynamic>;
        user(UsersModel.fromJson(userDocData));
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

        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  /// SKIP INTRO
  Future<bool> _isSkipIntro() async {
    final box = GetStorage();
    final read = box.read("skipIntro");
    if (read != null || read == true) {
      return true;
    } else {
      return false;
    }
  }

  /// INITIALIZED PERTAMA APAKAH SUDAH LOGIN DI MAIN FILE
  Future<void> firstInitialzed() async {
    await autoLogin().then((val) => val ? isAuth.value = true : null);
    await _isSkipIntro().then((val) => val ? isSkipIntro.value = true : null);
  }

  /// LOGIN FUNGSI
  void login() async {
    await _handleSignIn();

    // kalau semua berhasil akan ke home page
    Get.offAllNamed('/home');
  }

  /// LOGOUT
  void logout() async {
    _googleSignIn.signOut();
    _googleSignIn.disconnect();
    Get.offAllNamed('/login');
  }
}
