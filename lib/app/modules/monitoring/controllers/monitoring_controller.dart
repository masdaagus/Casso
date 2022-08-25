import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MonitoringController extends GetxController {
  final auth = Get.find<AuthController>();
  // var user = UsersModel().obs;
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  // late Order orderDataDariProses;

  // Stream<QuerySnapshot<Map<String, dynamic>>> initStream(String collection) {
  //   final data = firestore
  //       .collection("restos")
  //       .doc(user.value.restoID)
  //       .collection(collection)
  //       .orderBy('createAt')
  //       .snapshots();

  //   return data;
  // }

  // Future<void> setProsesAll(
  //   Order data,
  //   String id,
  //   String collectionLeft,
  //   String collectionRight,
  // ) async {
  //   CollectionReference collectLeft = firestore
  //       .collection("restos")
  //       .doc(user.value.restoID)
  //       .collection(collectionLeft);
  //   CollectionReference collectRight = firestore
  //       .collection("restos")
  //       .doc(user.value.restoID)
  //       .collection(collectionRight);

  //   final docProses = await collectRight.doc(id).get();

  //   try {
  //     List<ProductOrder> products = [];
  //     if (docProses.data() != null) {
  //       final objectDataProses = docProses.data() as Map<String, dynamic>;
  //       orderDataDariProses = Order.fromJson(objectDataProses);

  //       final x = orderDataDariProses.productsOrder!;
  //       products.addAll(x);
  //       products.addAll(data.productsOrder!);

  //       double _totalRight = 0;
  //       products.forEach((e) {
  //         _totalRight += (e.productQty * e.productPrice!);
  //       });

  //       collectRight.doc(id).update({
  //         "productsOrder": List<dynamic>.from(
  //           products.map(
  //             (x) => x.toJson(),
  //           ),
  //         ),
  //         "totalPrices": _totalRight,
  //       });
  //       collectLeft.doc(id).delete();
  //     } else {
  //       collectRight.doc(id).set(Order(
  //             orderId: data.orderId,
  //             guessName: data.guessName,
  //             tableNumber: data.tableNumber,
  //             waitersName: data.waitersName,
  //             totalPrices: data.totalPrices,
  //             productsOrder: data.productsOrder,
  //             createAt: data.createAt,
  //             orderNumber: data.orderNumber,
  //           ).toJson());

  //       collectLeft.doc(id).delete();
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> setProses(
  //   Order data,
  //   String id,
  //   ProductOrder product,
  //   String left,
  //   String right,
  // ) async {
  //   CollectionReference collectionLeft =
  //       firestore.collection("restos").doc(user.value.restoID).collection(left);
  //   CollectionReference collectionRight = firestore
  //       .collection("restos")
  //       .doc(user.value.restoID)
  //       .collection(right);
  //   ////////////////////////////////////////////////

  //   /// Mengambil data [Order] dari collection [Prosses]
  //   // final docProses = await collectionRight.doc(id).get();

  //   // if (docProses.data() != null) {
  //   //   final objectDataProses = docProses.data() as Map<String, dynamic>;
  //   //   orderDataDariProses = Order.fromJson(objectDataProses);
  //   // }
  //   ////////////////////////////////////////////////

  //   try {
  //     List<ProductOrder> productsProses = [];
  //     productsProses.add(product);
  //     ////////////////////////////////////////////////
  //     final checkDoc = await collectionRight.doc(id).get();

  //     /// INITIALIZE [orderDataDariProses] KALO DATA NYA ADA
  //     if (checkDoc.data() != null) {
  //       final objectDataProses = checkDoc.data() as Map<String, dynamic>;
  //       orderDataDariProses = Order.fromJson(objectDataProses);
  //     }

  //     if (checkDoc.data() == null) {
  //       /// setelah di cek apakah data sudah ada di collection proses atau belum
  //       /// jika belum berarti menambahkan [list order item] dari collection [pesanan] ke colection [proses]

  //       /// total prices harus di-update juga nihh
  //       double _totalRight = 0;
  //       _totalRight += (product.productPrice! * product.productQty);

  //       /// fungsi menambahkan data baru ke collection [proses]
  //       print("SET");
  //       await collectionRight.doc(id).set(Order(
  //             orderId: data.orderId,
  //             guessName: data.guessName,
  //             tableNumber: data.tableNumber,
  //             waitersName: data.waitersName,
  //             totalPrices: _totalRight,
  //             productsOrder: productsProses,
  //             createAt: data.createAt,
  //             orderNumber: data.orderNumber,
  //           ).toJson());

  //       /// menghapus [list order item] dari collection [pesanan]
  //       data.productsOrder!.remove(product);

  //       double _totalLeft = 0;
  //       data.productsOrder!.forEach((e) {
  //         _totalLeft += (e.productQty * e.productPrice!);
  //       });
  //       collectionLeft.doc(id).update({
  //         "productsOrder": List<dynamic>.from(
  //           data.productsOrder!.map(
  //             (x) => x.toJson(),
  //           ),
  //         ),
  //         "totalPrices": _totalLeft,
  //       });
  //     } else {
  //       print("UPDATE");
  //       final x = orderDataDariProses.productsOrder!;
  //       productsProses.addAll(x);
  //       double _totalRight = 0;
  //       productsProses.forEach((e) {
  //         _totalRight += (e.productQty * e.productPrice!);
  //       });

  //       collectionRight.doc(id).update({
  //         "productsOrder": List<dynamic>.from(
  //           productsProses.map(
  //             (x) => x.toJson(),
  //           ),
  //         ),
  //         "totalPrices": _totalRight,
  //       });

  //       /// menghapus [list order item] dari collection [left]
  //       data.productsOrder!.remove(product);
  //       double _totalLeft = 0;
  //       productsProses.forEach((e) {
  //         _totalLeft += (e.productQty * e.productPrice!);
  //       });
  //       collectionLeft.doc(id).update({
  //         "productsOrder": List<dynamic>.from(
  //           data.productsOrder!.map(
  //             (x) => x.toJson(),
  //           ),
  //         ),
  //         "totalPrices": _totalLeft,
  //       });
  //     }
  //     if (data.productsOrder!.length == 0) {
  //       collectionLeft.doc(id).delete();
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> reverseProses(
  //   Order data,
  //   String id,
  //   ProductOrder product,
  //   String left,
  //   String right,
  // ) async {
  //   CollectionReference collectionLeft =
  //       firestore.collection("restos").doc(user.value.restoID).collection(left);
  //   CollectionReference collectionRight = firestore
  //       .collection("restos")
  //       .doc(user.value.restoID)
  //       .collection(right);

  //   final leftData = await collectionLeft.doc(id).get();
  //   if (leftData.data() != null) {
  //     final objectDataProses = leftData.data() as Map<String, dynamic>;
  //     orderDataDariProses = Order.fromJson(objectDataProses);
  //   }

  //   try {
  //     List<ProductOrder> products = [];
  //     products.add(product);
  //     if (leftData.data() == null) {
  //       print("SET DATA BARU");
  //       double _totalLeft = 0;
  //       products.forEach((e) {
  //         _totalLeft += (e.productQty * e.productPrice!);
  //       });

  //       await collectionLeft.doc(id).set(Order(
  //             orderId: data.orderId,
  //             guessName: data.guessName,
  //             tableNumber: data.tableNumber,
  //             waitersName: data.waitersName,
  //             totalPrices: _totalLeft,
  //             productsOrder: products,
  //             createAt: data.createAt,
  //             orderNumber: data.orderNumber,
  //           ).toJson());

  //       /// menghapus [list order item] dari collection [pesanan]
  //       data.productsOrder!.remove(product);

  //       double _totalRight = 0;
  //       data.productsOrder!.forEach((e) {
  //         _totalRight += (e.productQty * e.productPrice!);
  //       });
  //       collectionRight.doc(id).update({
  //         "productsOrder": List<dynamic>.from(
  //           data.productsOrder!.map(
  //             (x) => x.toJson(),
  //           ),
  //         ),
  //         "totalPrices": _totalRight,
  //       });
  //     } else {
  //       print("UPDATE");
  //       final x = orderDataDariProses.productsOrder!;
  //       products.addAll(x);

  //       double _totalLeft = 0;
  //       products.forEach((e) {
  //         _totalLeft += (e.productQty * e.productPrice!);
  //       });

  //       collectionLeft.doc(id).update({
  //         "productsOrder": List<dynamic>.from(
  //           products.map(
  //             (x) => x.toJson(),
  //           ),
  //         ),
  //         "totalPrices": _totalLeft,
  //       });

  //       data.productsOrder!.remove(product);

  //       double _totalRight = 0;
  //       data.productsOrder!.forEach((e) {
  //         _totalRight += (e.productQty * e.productPrice!);
  //       });
  //       collectionRight.doc(id).update({
  //         "productsOrder": List<dynamic>.from(
  //           data.productsOrder!.map(
  //             (x) => x.toJson(),
  //           ),
  //         ),
  //         "totalPrices": _totalRight,
  //       });
  //     }
  //     if (data.productsOrder!.length == 0) {
  //       collectionRight.doc(id).delete();
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> deleteOrder(Order data, String id) async {
  //   CollectionReference ordersCollection = firestore
  //       .collection('restos')
  //       .doc(user.value.restoID)
  //       .collection('orders');

  //   CollectionReference prosesC = firestore
  //       .collection("restos")
  //       .doc(user.value.restoID)
  //       .collection("pesanan");

  //   // Get docs from collection reference
  //   QuerySnapshot querySnapshot = await ordersCollection.get();

  //   // Get data from docs and convert map to List
  //   await prosesC.doc(data.orderId).delete().then((value) {
  //     List<ProductOrder> products = []; // list untuk di update ke list orders

  //     querySnapshot.docs.map((doc) {
  //       var object = doc.data() as Map<String, dynamic>;
  //       final dataOrders = Order.fromJson(object);

  //       if (data.guessName == dataOrders.guessName &&
  //           data.tableNumber == dataOrders.tableNumber &&
  //           dataOrders.isPaid == false) {
  //         products.addAll(dataOrders.productsOrder!);

  //         data.productsOrder!.forEach((dataA) {
  //           dataOrders.productsOrder!.forEach((dataB) {
  //             if (dataA.productName == dataB.productName &&
  //                 dataA.productPrice == dataB.productPrice) {
  //               if (dataB.productQty > 1) {
  //                 products.remove(dataB);

  //                 dataB.productQty -= dataA.productQty;
  //                 if (dataB.productQty != 0) {
  //                   products.add(dataB);
  //                 } else {
  //                   products.remove(dataB);
  //                 }
  //               } else {
  //                 print('${dataB.productName}  ${dataB.productQty}');
  //                 products.remove(dataB);
  //               }
  //             }
  //           });
  //         });

  //         final ids = Set();
  //         products.retainWhere(
  //           (x) => ids.add(x.productName),
  //         );

  //         double _totalPriceOrders = 0;
  //         products.forEach((e) {
  //           _totalPriceOrders += (e.productQty * e.productPrice!);
  //         });

  //         if (products.length > 0) {
  //           ordersCollection.doc(doc.id).update({
  //             "productsOrder": List<dynamic>.from(
  //               products.map(
  //                 (x) => x.toJson(),
  //               ),
  //             ),
  //             "totalPrices": _totalPriceOrders,
  //           });
  //         } else {
  //           ordersCollection.doc(doc.id).delete();
  //         }
  //       }

  //       // return data;
  //     }).toList();
  //   });
  // }

  // @override
  // void onInit() async {
  //   user = auth.user;

  //   super.onInit();
  // }

  // @override
  // void onReady() async {
  //   // await initStream('pesanan');
  //   // await initStream('proses');
  //   // await initStream('siap');
  //   // await initStream('tersaji');
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.dispose();
  // }
}
