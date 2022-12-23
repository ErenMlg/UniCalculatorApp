import 'package:flutter/material.dart';

class Sabitler {
  static const MaterialColor anaRenk = Colors.indigo;
  static const ikinciRenk = Colors.white;
  static const String menuHeaderText = "Üniversite Not Hesaplayıcı";

  static const TextStyle headerStyle = TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 17,
      color: anaRenk,
      fontWeight: FontWeight.w900);

  static const TextStyle emptyListStyle = TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 17,
      color: anaRenk,
      fontWeight: FontWeight.w600);

  static const TextStyle menuHeaderStyle = TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 24,
      color: ikinciRenk,
      fontWeight: FontWeight.w900);

  static const TextStyle yardimHeaderStyle = TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 20,
      color: anaRenk,
      fontWeight: FontWeight.w900);

  static const TextStyle NumberStyle = TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 45,
      color: anaRenk,
      fontWeight: FontWeight.w800);

  static const TextStyle paragraphStyle = TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 16,
      color: anaRenk,
      fontWeight: FontWeight.w600);

  static final TextStyle alertBoxStyle = TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 16,
      color: Color.fromARGB(255, 21, 21, 21),
      fontWeight: FontWeight.w400);

  static const TextStyle buttonTextStyle = TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 20,
      color: anaRenk,
      fontWeight: FontWeight.w600);

  static final BorderRadius myBorderRadius = BorderRadius.circular(16);

  static final BorderRadius myButtonBorderRadius = BorderRadius.circular(12);

  static const EdgeInsets dropdownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static const EdgeInsets outlinePadding = EdgeInsets.symmetric(horizontal: 8);

  static const IconThemeData backButtonTheme =
      IconThemeData(color: anaRenk, size: 36);
}
