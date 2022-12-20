import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor anaRenk = Colors.indigo;
  static const ikinciRenk = Colors.white;
  static const String menuHeaderText = "Üniversite Not Hesaplayıcı";
  static final TextStyle headerStyle = GoogleFonts.quicksand(
      fontSize: 17, fontWeight: FontWeight.w900, color: anaRenk);

  static final TextStyle menuHeaderStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: ikinciRenk);

  static final TextStyle NumberStyle = GoogleFonts.quicksand(
      fontSize: 45, fontWeight: FontWeight.w800, color: anaRenk);

  static final TextStyle paragraphStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: anaRenk);

  static final TextStyle alertBoxStyle =
      GoogleFonts.quicksand(fontSize: 16,fontWeight: FontWeight.w400, color: Colors.black);

  static final TextStyle buttonTextStyle = GoogleFonts.quicksand(
      fontSize: 20, fontWeight: FontWeight.w600, color: anaRenk);

  static final BorderRadius myBorderRadius = BorderRadius.circular(16);

  static final BorderRadius myButtonBorderRadius = BorderRadius.circular(12);

  static const EdgeInsets dropdownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static const EdgeInsets outlinePadding = EdgeInsets.symmetric(horizontal: 8);

  static const IconThemeData backButtonTheme =
      IconThemeData(color: anaRenk, size: 36);
}
