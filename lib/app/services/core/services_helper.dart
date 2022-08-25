import 'dart:developer';

import 'package:casso/app/data/model/product_model.dart';
import 'package:casso/app/data/model/transaction_model.dart';
import 'package:casso/app/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

const transactionDoccument = 'transactions';

extension GetBox on GetStorage {
  Future<void> createToken(String token) async {
    final box = GetStorage();

    String? checkToken = await box.read('token');
    if (checkToken != null) {
      await box.remove('token');
    }

    await box.write("token", token);
  }

  Future<String> readToken() async {
    GetStorage box = GetStorage();
    String? val = await box.read("token");
    return val.toString();
  }

  Future<void> removeToken() async {
    GetStorage box = GetStorage();
    await box.remove("token");
  }
}

extension FirestoreX on FirebaseFirestore {
  Future<void> setUser(String uid, UserModel user) async {
    final usersCollection = FirebaseFirestore.instance.collection("users");

    await usersCollection.doc(uid).set(user.toJson());
  }

  Future<DocumentReference<Map<String, dynamic>>> setTransaction(
    String uid,
    Map<String, dynamic> data,
  ) async {
    final transactionCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection(transactionDoccument);

    return await transactionCollection.add(data).then((value) async {
      await value.update({
        'transactionId': value.id,
      });
      return value;
    });
  }

  Future<List<Map<String, dynamic>>> readTransactions(String uid) async {
    List<Map<String, dynamic>> _data = [];
    final transactionCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection(transactionDoccument)
        .get();

    final map = await transactionCollection;
    final dataDocs = await map.docs;
    dataDocs.forEach((element) {
      _data.add(element.data());
    });
    return _data;
  }
}
