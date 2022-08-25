import 'dart:developer';

import 'package:casso/app/data/model/product_model.dart';
import 'package:casso/app/data/model/transaction_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const tableProduct = 'table_products';
const tableTransaction = 'table_transaction';
const tableItemTrx = 'table_item_transaction';

class SQLHelper {
  static Future<Database> db() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'app.db');
    var database = await openDatabase(path, version: 1, onCreate: createTables);
    return database;
  }

  static Future<void> createTables(Database database, int version) async {
    await database.execute("""CREATE TABLE $tableProduct(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        productName TEXT,
        productPrice REAL,
        productCategory TEXT,
        productImage TEXT,
        productQty INTEGER)
      """);
    await database.execute("""CREATE TABLE $tableTransaction(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        transactionId TEXT,
        createAt TEXT,
        totalPrices REAL,
        productsTransaction TEXT)
      """);
    await database.execute("""CREATE TABLE $tableItemTrx(
        id INTEGER,
        productName TEXT,
        productPrice REAL,
        productCategory TEXT,
        productImage TEXT,
        productQty INTEGER)
      """);
  }

  /// [============================TRANSACTION==============================]
  static Future<List<Map<String, Object?>>> getItemTransactions(int id) async {
    final db = await SQLHelper.db();

    List<Map<String, Object?>> itemTransactions = await db.query(
      tableItemTrx,
      where: 'id = ?',
      whereArgs: [id],
      // orderBy: "id",
    );

    return itemTransactions;
  }

  static Future<int> deleteItemTransactions(int id) async {
    final db = await SQLHelper.db();

    int itemTransactions = await db.delete(
      tableItemTrx,
      where: 'id = ?',
      whereArgs: [id],
      // orderBy: "id",
    );

    return itemTransactions;
  }

  static Future<int> insertItemOrder(ProductModel product) async {
    final db = await SQLHelper.db();

    final id = await db.insert(tableItemTrx, product.toJson());
    return id;
  }

  static Future<int> setTransaction(Map<String, dynamic> trx) async {
    final db = await SQLHelper.db();
    final id = await db.insert(tableTransaction, trx);
    return id;
  }

  static Future<List<TransactionModel>> getTransactions() async {
    List<TransactionModel> transactions = <TransactionModel>[];

    final db = await SQLHelper.db();
    final trx = await db.query(tableTransaction);

    for (var i = 0; i < trx.length; i++) {
      List<ProductModel> itemOrders = <ProductModel>[];
      final transaction = TransactionModel.fromJson(trx[i]);

      final listItemOrder = await getItemTransactions(transaction.id!);

      for (int j = 0; j < listItemOrder.length; j++) {
        final itemOrder = ProductModel.fromJson(listItemOrder[j]);
        itemOrders.add(itemOrder);
      }
      final finalTrx = transaction.copyWith(productsTransaction: itemOrders);
      transactions.add(finalTrx);
    }
    return transactions;
  }

  static Future<int> deleteTransaction(int idTrx) async {
    final db = await SQLHelper.db();

    final id = await db.delete(
      tableTransaction,
      where: 'id = ?',
      whereArgs: [idTrx],
    );

    await deleteItemTransactions(id);

    return id;
  }

  /// [============================PRODUCT==============================]
  static Future<int> insertData(ProductModel data) async {
    final db = await SQLHelper.db();

    final id = await db.insert(
      tableProduct,
      data.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return id;
  }

  // Update item
  static Future<int> updateData(ProductModel data) async {
    final db = await SQLHelper.db();

    final _id = db.update(
      tableProduct,
      data.toJson(),
      whereArgs: [data.id],
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return _id;
  }

  // Read all items
  static Future<List<ProductModel>> getItems() async {
    final db = await SQLHelper.db();

    List<ProductModel> products = <ProductModel>[];

    List<Map<String, Object?>> sqlProducts = await db.query(
      tableProduct,
      orderBy: "id",
    );

    for (var i = 0; i < sqlProducts.length; i++) {
      ProductModel promodel = ProductModel.fromJson(sqlProducts[i]);
      products.add(promodel);
    }

    return products;
  }

  static Future<List<ProductModel>> getProducts() async {
    final db = await SQLHelper.db();
    final products =
        await db.query(tableProduct, orderBy: "id") as Map<String, dynamic>;

    log('PRODUCTS = ${products}');

    return <ProductModel>[];
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query(tableProduct, where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> deleteProducts(ProductModel product) async {
    final db = await SQLHelper.db();

    return db.delete(tableProduct, whereArgs: [product.id], where: 'id = ?');
  }
}
