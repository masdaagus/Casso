import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

const darkColor = Color(0XFF2B333D);
const lightColor = Color(0XFFEDEDE9);

const orange = Color(0XFFE19D0A);
const biru = Color(0XFF81B1FA);
const hijau = Color(0XFF00C500);
const merah = Color(0XFFEF233C);
const abu = Color(0XFFD1D1D1);
const bgColor = Color(0XFFF2F2F2);
const textDark = Color(0XFFF7B7882);
const transparant = Colors.transparent;

const putih = Colors.white;
const hitam = Colors.black;

const grColor1 = [Color(0XFFF8E9FB), Color(0XFFE4EFFF)];
const grColor2 = [Color(0XFFA0B5EB), Color(0XFFC9F0E4)];

const emailKey = 'email';
const passwordKey = 'password';

NumberFormat nf = NumberFormat.simpleCurrency(
  locale: 'IDN',
  decimalDigits: 0,
);

DateFormat dateFormat = DateFormat("dd-MM-yyyy HH:mm");
DateFormat df = DateFormat("dd-MM-yyyy");

const mySystemTheme = SystemUiOverlayStyle(
  systemNavigationBarColor: lightColor,
  systemNavigationBarIconBrightness: Brightness.dark,
);

const styl = TextStyle(
  color: darkColor,
  fontFamily: "Ubuntu",
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

const serverKey =
    'AAAAAF10iMk:APA91bFGDodqhpbvmQjNyrNxY_PrIlgtM8_HoPkT6WIu-QRilf2JUDT-YhO6NkHpqHHC6pzmCDwWDVtsN_vDbMdK_A4xl4cFtead5qP7hgicSp_dg2JD0u-TCXlWPQYlLrlx7vU7jFoz';

const googleFcm = 'https://fcm.googleapis.com/fcm/send';
