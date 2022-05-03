import 'package:casso/app/data/models/users.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class EmployeDetailView extends StatelessWidget {
  const EmployeDetailView({
    Key? key,
    this.data,
  }) : super(key: key);

  final UsersModel? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(data!.name ?? ''),
          Text(data!.email ?? ''),
          Text(data!.password ?? ''),
          Text(data!.status ?? ''),
          Text(data!.restoID ?? ''),
          Text(data!.uid ?? ''),
        ],
      ),
    );
  }
}
