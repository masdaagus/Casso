import 'package:casso/app/data/models/table.dart';
import 'package:casso/app/modules/card/table_card/table_card.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../menu/controllers/menu_controller.dart';
import '../controllers/order_controller.dart';
import 'components/dialog.dart';
import 'components/dialog_move_table.dart';

class OrderView extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: lightColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: darkColor,
      statusBarBrightness: Brightness.light,
    ));
    Get.put(MenuController());
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 0,
        title: Text(
          'ORDER',
          style: TextStyle(
            color: lightColor,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: lightColor,
          ),
          onPressed: Get.back,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 24, top: 24, right: 24),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
              // children: [
              //   StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              //     stream: controller.initStream(),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.active) {
              //         Map<String, dynamic> data =
              //             snapshot.data!.data() as Map<String, dynamic>;

              //         List<TableModel> tables = List<TableModel>.from(
              //             data["tables"].map((x) => TableModel.fromJson(x)));

              //         return Container(
              //           child: GridView.count(
              //             shrinkWrap: true,
              //             crossAxisSpacing: 20,
              //             mainAxisSpacing: 20,
              //             crossAxisCount: 3,
              //             childAspectRatio: .9,
              //             physics: BouncingScrollPhysics(),
              //             children: List.generate(
              //               tables.length,
              //               (index) {
              //                 TableModel table = tables[index];
              //                 return TableCard(
              //                   tableNumber: table.tableNumber!,
              //                   guessName: table.guessName,
              //                   onTap: () {
              //                     if (table.guessName == null) {
              //                       controller.guessNameController.clear();
              //                       Get.defaultDialog(
              //                         content: GetDialog(
              //                           tableNumber: table.tableNumber!,
              //                         ),
              //                         backgroundColor: Colors.transparent,
              //                         titleStyle:
              //                             TextStyle(color: Colors.transparent),
              //                         barrierDismissible: false,
              //                       );
              //                     } else {
              //                       Get.defaultDialog(
              //                         content: DialogMoveTable(
              //                           tableNumber: table.tableNumber!,
              //                         ),
              //                         backgroundColor: Colors.transparent,
              //                         titleStyle:
              //                             TextStyle(color: Colors.transparent),
              //                       );
              //                     }
              //                   },
              //                 );
              //               },
              //             ),
              //           ),
              //         );
              //       }
              //       return Container();
              //     },
              //   ),
              //   SizedBox(height: 20),
              // ],
              ),
        ),
      ),
    );
  }

  Widget textTab(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Text(
          text,
          style: TextStyle(
            color: darkColor,
            fontSize: 11,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
