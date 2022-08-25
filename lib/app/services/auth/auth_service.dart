import 'dart:developer';

import 'package:casso/app/services/core/sql_helper.dart';
import 'package:casso/app/services/products/product_service.dart';
import 'package:casso/app/utils/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/model/product_model.dart';
import '../../data/model/user_model.dart';

import 'package:get_storage/get_storage.dart';
import '../core/services_helper.dart';

class AuthentivicationService {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GetStorage _storage = GetStorage();
  final ProductService _sqlService = ProductService();

  late GoogleSignInAccount? _curentUser;
  late UserCredential _userCredential;

  Future<String?> getToken() async {
    final _token = await _storage.readToken();
    return _token;
  }

  Future<bool> autoLogin() async {
    late bool isLogin;
    final _token = await _storage.readToken();

    if (_token == null || _token == 'null') {
      isLogin = false;
    } else {
      isLogin = true;
    }

    return isLogin;
  }

  Future<UserModel> loginWithGoogle() async {
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
        await _firebaseAuth.signInWithCredential(credential).then((value) {
          _userCredential = value;
        });

        String _uid = _userCredential.user!.uid;
        UserModel userModel = UserModel(
          uid: _uid,
          name: _curentUser?.displayName,
          email: _curentUser?.email,
          products: <ProductModel>[],
        );

        await _firestore.setUser(_uid, userModel);
        await _storage.createToken(_uid);
        await _sqlService.initProduct();

        return userModel;
      } else {
        Get.back();
      }

      return UserModel();
    } catch (error) {
      return UserModel();
    }
  }

  Future<void> logout() async {
    try {
      await _googleSignIn.signOut();
      await _storage.removeToken();
    } catch (e) {}
  }
}
