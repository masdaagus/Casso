import 'dart:developer';

import 'package:casso/app/data/model/transaction_model.dart';
import 'package:casso/app/services/core/services_helper.dart';
import 'package:casso/app/services/core/sql_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/model/product_model.dart';

class TransactionService {
  FlutterNetworkConnectivity _networkConnectivity =
      FlutterNetworkConnectivity(isContinousLookUp: true);
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  GetStorage _storage = GetStorage();

  Future<void> makeTransaction(
    String uid,
    TransactionModel transaction,
    List<ProductModel> products,
  ) async {
    bool _isInternetConnected =
        await _networkConnectivity.isNetworkConnectionAvailable();

    if (_isInternetConnected) {
      // send data to firebase
      await _firestore.setTransaction(uid, transaction.toJson());
    } else {
      // send data to sqlte
      final trxToSql = transaction.copyWith(productsTransaction: []);
      final trx = await SQLHelper.setTransaction(trxToSql.toJson());

      for (var i = 0; i < products.length; i++) {
        final product = products[i].copyWith(id: trx);
        await SQLHelper.insertItemOrder(product);
      }
    }
  }

  Future<List<TransactionModel>> readTransactions() async {
    List<TransactionModel> _transactions = <TransactionModel>[];

    bool isConnected =
        await _networkConnectivity.isNetworkConnectionAvailable();

    final token = await _storage.readToken();

    if (isConnected) {
      final mapData = await _firestore.readTransactions(token);
      for (int i = 0; i < mapData.length; i++) {
        final trx = TransactionModel.fromJson(mapData[i]);
        _transactions.add(trx);
      }
    } else {
      final mapData = await SQLHelper.getTransactions();
      _transactions = mapData;
    }

    return _transactions;
  }

  Future<List<TransactionModel>> asyncTrxTofirebase() async {
    List<TransactionModel> _transactions = <TransactionModel>[];

    bool isConnected =
        await _networkConnectivity.isNetworkConnectionAvailable();

    final token = await _storage.readToken();
    final mapData = await SQLHelper.getTransactions();

    if (isConnected && mapData.length > 0) {
      for (int i = 0; i < mapData.length; i++) {
        /// send data to firebase
        log('loop');
        await _firestore.setTransaction(token, mapData[i].toJson());
        await SQLHelper.deleteTransaction(mapData[i].id!);
      }
    }
    log('success');

    return _transactions;
  }
}
