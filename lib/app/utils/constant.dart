import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

const darkColor = Color(0XFF2B333D);
const lightColor = Color(0XFFEDEDE9);
const iconColor = Color(0XFFA4A4A4);
const orange = Color(0XFFE19D0A);
const biru = Color(0XFF81B1FA);
const purple = Color(0XFFEDAEF9);
const hijau = Color(0XFF00C500);
const merah = Color(0XFFEF233C);
const ungu = Color(0XFFB44CC7);
const abu = Color(0XFFD1D1D1);

const putih = Colors.white;
const hitam = Colors.black;

const grColor1 = [Color(0XFFF8E9FB), Color(0XFFE4EFFF)];
const grColor2 = [Color(0XFFA0B5EB), Color(0XFFC9F0E4)];

const emailKey = 'email';
const passwordKey = 'password';

const padding = 20.0;

NumberFormat nf = NumberFormat.simpleCurrency(
  locale: 'IDN',
  decimalDigits: 0,
);

DateFormat dateFormat = DateFormat("dd-MM-yyyy HH:mm");
const mySystemTheme = SystemUiOverlayStyle(
  systemNavigationBarColor: lightColor,
  systemNavigationBarIconBrightness: Brightness.dark,
);

const styl = TextStyle(
  color: darkColor,
  fontFamily: "balsamiq",
  fontSize: 18,
  fontWeight: FontWeight.w500,
);
