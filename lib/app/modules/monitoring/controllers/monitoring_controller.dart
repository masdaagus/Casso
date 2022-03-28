import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MonitoringController extends GetxController {
  final auth = Get.find<AuthController>();
  var user = UsersModel().obs;
  var order = Order().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Order? orderDataDariProses;
  late Order orderDataDariPesanan;

  Stream<QuerySnapshot<Map<String, dynamic>>> pesananStream() {
    final data = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("pesanan")
        .snapshots();

    return data;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> prosesStream() {
    final data = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("proses")
        .snapshots();

    return data;
  }

  Future<void> setProsesAll(Order data, String id) async {
    CollectionReference prosesC = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("proses");
    CollectionReference pesananC = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("pesanan");

    try {
      prosesC.doc(id).set(Order(
            guessName: data.guessName,
            tableNumber: data.tableNumber,
            waitersName: data.waitersName,
            totalPrices: data.totalPrices,
            totalItems: data.totalItems,
            productsOrder: data.productsOrder,
          ).toJson());

      pesananC.doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteCollection(String id) async {
    CollectionReference prosesC = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("proses");
    prosesC.doc(id).delete();
  }

  Future<void> tesss(String id) async {
    CollectionReference prosesC = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("proses");

    final checkDoc = await prosesC.doc(id).get();
    final data = checkDoc.data() as Map<String, dynamic>;
    Order o = Order.fromJson(data);

    print(o.guessName);
  }

  Future<void> setProses(Order data, String id, ProductOrder product) async {
    CollectionReference prosesC = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("proses");
    CollectionReference pesananC = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("pesanan");
    ////////////////////////////////////////////////

    /// [List Product Order] dari collection [pesanan]
    // List<ProductOrder> productsFromPesanan =
    //     orderDataDariPesanan.productsOrder!;
    // productsFromPesanan.add(product);
    ////////////////////////////////////////////////

    /// Mengambil data [Order] dari collection [Prosses]
    final docProses = await prosesC.doc(id).get();

    if (docProses.data() != null) {
      final objectDataProses = docProses.data() as Map<String, dynamic>;
      orderDataDariProses = Order.fromJson(objectDataProses);
    }
    ////////////////////////////////////////////////

    /// [List Product Order] dari collection [proses]
    // List<ProductOrder> productsProses = [];
    List<ProductOrder> productsProses = [];
    // ...orderDataDariProses!.productsOrder!
    productsProses.add(product);
    ////////////////////////////////////////////////

    try {
      final checkDoc = await prosesC.doc(id).get();

      if (checkDoc.data() == null) {
        /// setelah di cek apakah data sudah ada di collection proses atau belum
        /// jika belum berarti menambahkan [list order item] dari collection [pesanan] ke colection [proses]

        /// fungsi menambahkan data baru ke collection [proses]
        print("SET");
        await prosesC.doc(id).set(Order(
              guessName: data.guessName,
              tableNumber: data.tableNumber,
              waitersName: data.waitersName,
              totalPrices: data.totalPrices,
              totalItems: data.totalItems,
              productsOrder: productsProses,
            ).toJson());

        /// menghapus [list order item] dari collection [pesanan]
        data.productsOrder!.remove(product);
        pesananC.doc(id).update({
          "productsOrder": List<dynamic>.from(
            data.productsOrder!.map(
              (x) => x.toJson(),
            ),
          ),
        });
      } else {
        print("UPDATE");
        prosesC.doc(id).update(Order(
              guessName: data.guessName,
              tableNumber: data.tableNumber,
              waitersName: data.waitersName,
              totalPrices: data.totalPrices,
              totalItems: data.totalItems,
              productsOrder: productsProses,
            ).toJson());

        data.productsOrder!.remove(product);
        pesananC.doc(id).update({
          "productsOrder": List<dynamic>.from(
            data.productsOrder!.map(
              (x) => x.toJson(),
            ),
          ),
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    user = auth.user;
    await pesananStream();
    await prosesStream();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.dispose();
  }
}
