// import 'package:bluetooth_print/bluetooth_print.dart';
// import 'package:bluetooth_print/bluetooth_print_model.dart';
// import 'package:flutter/material.dart';

// class MasdaAgus extends StatefulWidget {
//   const MasdaAgus({Key? key}) : super(key: key);

//   @override
//   MasdaAgusState createState() => MasdaAgusState();
// }

// class MasdaAgusState extends State<MasdaAgus> {
//   BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
//   List<BluetoothDevice> _devices = [];
//   String _devicesMsg = "";

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance!.addPostFrameCallback((_) => {initPrinter()});
//   }

//   Future<void> initPrinter() async {
//     bluetoothPrint.startScan(timeout: Duration(seconds: 5));

//     if (!mounted) return;
//     bluetoothPrint.scanResults.listen(
//       (devices) async {
//         print("value nya = $devices");
//         if (!mounted) return;
//         setState(() => {_devices = devices});
//         if (_devices.isEmpty) {
//           setState(() {
//             _devicesMsg = "No Devices";
//           });
//         } else {
//           setState(() {
//             _devicesMsg = 'ADA NIH';
//           });
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _devices.isEmpty
//           ? Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(_devicesMsg),
//                   ElevatedButton(
//                       onPressed: () {
//                         initPrinter();
//                       },
//                       child: Text("TES"))
//                 ],
//               ),
//             )
//           : ListView.builder(
//               itemCount: _devices.length,
//               itemBuilder: (c, i) {
//                 return ListTile(
//                   leading: Icon(Icons.print),
//                   title: Text(_devices[i].name!),
//                   subtitle: Text(_devices[i].address!),
//                   onTap: () {
//                     // _startPrint(_devices[i]);
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }
