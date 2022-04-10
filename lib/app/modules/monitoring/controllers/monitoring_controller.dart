import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MonitoringController extends GetxController {
  final auth = Get.find<AuthController>();
  var user = UsersModel().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late Order orderDataDariProses;

  Stream<QuerySnapshot<Map<String, dynamic>>> initStream(String collection) {
    final data = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection(collection)
        .orderBy('createAt')
        .snapshots();

    return data;
  }

  Future<void> setProsesAll(
    Order data,
    String id,
    String collectionLeft,
    String collectionRight,
  ) async {
    CollectionReference collectLeft = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection(collectionLeft);
    CollectionReference collectRight = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection(collectionRight);

    final docProses = await collectRight.doc(id).get();
    DateTime now = DateTime.now();

    try {
      List<ProductOrder> products = [];
      if (docProses.data() != null) {
        final objectDataProses = docProses.data() as Map<String, dynamic>;
        orderDataDariProses = Order.fromJson(objectDataProses);

        final x = orderDataDariProses.productsOrder!;
        products.addAll(x);
        products.addAll(data.productsOrder!);

        collectRight.doc(id).update({
          "productsOrder": List<dynamic>.from(
            products.map(
              (x) => x.toJson(),
            ),
          ),
        });
        collectLeft.doc(id).delete();
      } else {
        collectRight.doc(id).set(Order(
              guessName: data.guessName,
              tableNumber: data.tableNumber,
              waitersName: data.waitersName,
              totalPrices: data.totalPrices,
              productsOrder: data.productsOrder,
              createAt: now.toIso8601String(),
              orderNumber: 1,
            ).toJson());

        collectLeft.doc(id).delete();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> setProses(
    Order data,
    String id,
    ProductOrder product,
    String left,
    String right,
  ) async {
    DateTime now = DateTime.now();

    ///
    CollectionReference collectionLeft =
        firestore.collection("restos").doc(user.value.restoID).collection(left);
    CollectionReference collectionRight = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection(right);
    ////////////////////////////////////////////////

    /// Mengambil data [Order] dari collection [Prosses]
    final docProses = await collectionRight.doc(id).get();

    if (docProses.data() != null) {
      final objectDataProses = docProses.data() as Map<String, dynamic>;
      orderDataDariProses = Order.fromJson(objectDataProses);
    }
    ////////////////////////////////////////////////

    try {
      List<ProductOrder> productsProses = [];
      productsProses.add(product);
      ////////////////////////////////////////////////
      final checkDoc = await collectionRight.doc(id).get();

      if (checkDoc.data() == null) {
        /// setelah di cek apakah data sudah ada di collection proses atau belum
        /// jika belum berarti menambahkan [list order item] dari collection [pesanan] ke colection [proses]

        /// fungsi menambahkan data baru ke collection [proses]
        print("SET");
        await collectionRight.doc(id).set(Order(
              guessName: data.guessName,
              tableNumber: data.tableNumber,
              waitersName: data.waitersName,
              totalPrices: data.totalPrices,
              productsOrder: productsProses,
              createAt: now.toIso8601String(),
              orderNumber: 1,
            ).toJson());

        /// menghapus [list order item] dari collection [pesanan]
        data.productsOrder!.remove(product);
        collectionLeft.doc(id).update({
          "productsOrder": List<dynamic>.from(
            data.productsOrder!.map(
              (x) => x.toJson(),
            ),
          ),
        });
      } else {
        print("UPDATE");
        final x = orderDataDariProses.productsOrder!;
        productsProses.addAll(x);

        collectionRight.doc(id).update({
          "productsOrder": List<dynamic>.from(
            productsProses.map(
              (x) => x.toJson(),
            ),
          ),
        });

        /// menghapus [list order item] dari collection [pesanan]
        data.productsOrder!.remove(product);
        collectionLeft.doc(id).update({
          "productsOrder": List<dynamic>.from(
            data.productsOrder!.map(
              (x) => x.toJson(),
            ),
          ),
        });
      }
      if (data.productsOrder!.length == 0) {
        collectionLeft.doc(id).delete();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> reverseProses(
    Order data,
    String id,
    ProductOrder product,
    String left,
    String right,
  ) async {
    CollectionReference collectionLeft =
        firestore.collection("restos").doc(user.value.restoID).collection(left);
    CollectionReference collectionRight = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection(right);

    final leftData = await collectionLeft.doc(id).get();
    if (leftData.data() != null) {
      final objectDataProses = leftData.data() as Map<String, dynamic>;
      orderDataDariProses = Order.fromJson(objectDataProses);
    }

    try {
      List<ProductOrder> products = [];
      products.add(product);
      if (leftData.data() == null) {
        print("SET DATA BARU");
        DateTime now = DateTime.now();

        await collectionLeft.doc(id).set(Order(
              guessName: data.guessName,
              tableNumber: data.tableNumber,
              waitersName: data.waitersName,
              totalPrices: data.totalPrices,
              productsOrder: products,
              createAt: now.toIso8601String(),
              orderNumber: 1,
            ).toJson());

        /// menghapus [list order item] dari collection [pesanan]
        data.productsOrder!.remove(product);
        collectionRight.doc(id).update({
          "productsOrder": List<dynamic>.from(
            data.productsOrder!.map(
              (x) => x.toJson(),
            ),
          ),
        });
      } else {
        print("UPDATE");
        final x = orderDataDariProses.productsOrder!;
        products.addAll(x);

        collectionLeft.doc(id).update({
          "productsOrder": List<dynamic>.from(
            products.map(
              (x) => x.toJson(),
            ),
          ),
        });
        data.productsOrder!.remove(product);
        collectionRight.doc(id).update({
          "productsOrder": List<dynamic>.from(
            data.productsOrder!.map(
              (x) => x.toJson(),
            ),
          ),
        });
      }
      if (data.productsOrder!.length == 0) {
        collectionRight.doc(id).delete();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteOrder(Order data, String id) async {
    CollectionReference _collectionRef = firestore
        .collection('restos')
        .doc(user.value.restoID)
        .collection('orders');

    CollectionReference prosesC = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("pesanan");

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    await prosesC.doc(id).delete();

    List<ProductOrder> products = []; // list untuk di update ke list orders

    // List<Order> ordersCollection =
    querySnapshot.docs.map((doc) {
      var object = doc.data() as Map<String, dynamic>;
      final dataOrders = Order.fromJson(object);

      if (data.guessName == dataOrders.guessName &&
          data.tableNumber == dataOrders.tableNumber) {
        products.addAll(dataOrders.productsOrder!);

        data.productsOrder!.forEach((dataA) {
          dataOrders.productsOrder!.forEach((dataB) {
            if (dataA.productName == dataB.productName &&
                dataA.productPrice == dataB.productPrice) {
              if (dataB.productQty > 1) {
                products.remove(dataB);
                print('data lebih dari 1');
                print('${dataB.productName}  ${dataB.productQty}');
                dataB.productQty -= dataA.productQty;
                if (dataB.productQty != 0) {
                  products.add(dataB);
                } else {
                  products.remove(dataB);
                }
              } else {
                print('${dataB.productName}  ${dataB.productQty}');
                products.remove(dataB);
              }
            }
          });
        });

        final ids = Set();
        products.retainWhere(
          (x) => ids.add(x.productName),
        );

        if (products.length > 0) {
          _collectionRef.doc(doc.id).update({
            "productsOrder": List<dynamic>.from(
              products.map(
                (x) => x.toJson(),
              ),
            ),
          });
        } else {
          _collectionRef.doc(doc.id).delete();
        }
      }

      // return data;
    }).toList();
  }

  @override
  void onInit() async {
    user = auth.user;

    super.onInit();
  }

  @override
  void onReady() async {
    await initStream('pesanan');
    await initStream('proses');
    await initStream('siap');
    await initStream('tersaji');

    super.onReady();
  }

  @override
  void onClose() {
    super.dispose();
  }
}
