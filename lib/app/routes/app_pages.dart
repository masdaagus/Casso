import 'package:get/get.dart';

import 'package:casso/app/modules/cashier/bindings/cashier_binding.dart';
import 'package:casso/app/modules/cashier/views/cashier_view.dart';
import 'package:casso/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:casso/app/modules/dashboard/views/dashboard_view.dart';
import 'package:casso/app/modules/edit_product/bindings/edit_product_binding.dart';
import 'package:casso/app/modules/edit_product/views/edit_product_view.dart';
import 'package:casso/app/modules/home/bindings/home_binding.dart';
import 'package:casso/app/modules/home/views/home_view.dart';
import 'package:casso/app/modules/login/bindings/login_binding.dart';
import 'package:casso/app/modules/login/views/login_view.dart';
import 'package:casso/app/modules/menu/bindings/menu_binding.dart';
import 'package:casso/app/modules/menu/views/menu_view.dart';
import 'package:casso/app/modules/monitoring/bindings/monitoring_binding.dart';
import 'package:casso/app/modules/monitoring/views/monitoring_view.dart';
import 'package:casso/app/modules/order/bindings/order_binding.dart';
import 'package:casso/app/modules/order/views/order_view.dart';
import 'package:casso/app/modules/printer/bindings/printer_binding.dart';
import 'package:casso/app/modules/printer/views/printer_view.dart';
import 'package:casso/app/modules/product/bindings/product_binding.dart';
import 'package:casso/app/modules/product/views/product_view.dart';
import 'package:casso/app/modules/resto/bindings/resto_binding.dart';
import 'package:casso/app/modules/resto/views/resto_view.dart';
import 'package:casso/app/modules/transaction/bindings/transaction_binding.dart';
import 'package:casso/app/modules/transaction/views/transaction_view.dart';

// import 'package:casso/app/modules/introduction/bindings/introduction_binding.dart';
// import 'package:casso/app/modules/introduction/views/introduction_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CASHIER,
      page: () => CashierView(),
      binding: CashierBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => Menus(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: _Paths.MONITORING,
      page: () => MonitoringView(),
      binding: MonitoringBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    // GetPage(
    //   name: _Paths.INTRODUCTION,
    //   page: () => IntroductionView(),
    //   binding: IntroductionBinding(),
    // ),
    // GetPage(
    //   name: _Paths.EMPLOYE,
    //   page: () => EmployeView(),
    //   binding: PegawaiBinding(),
    // ),
    // GetPage(
    //   name: _Paths.DASHBOARD,
    //   page: () => DashboardView(),
    //   binding: DashboardBinding(),
    // ),
    GetPage(
      name: _Paths.PRINTER,
      page: () => PrinterView(),
      binding: PrinterBinding(),
    ),
    GetPage(
      name: _Paths.RESTO,
      page: () => RestoView(),
      binding: RestoBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT,
      page: () => EditProductView(),
      binding: EditProductBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => TransactionView(),
      binding: TransactionBinding(),
    ),
  ];
}
