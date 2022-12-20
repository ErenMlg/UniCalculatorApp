import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/model/constants/app_constants.dart';

class OrtalamaGosterPage extends StatelessWidget {
  final String bilgi;
  final double ortalama;
  final int dersSayisi;
  const OrtalamaGosterPage(
      {required this.dersSayisi,
      required this.bilgi,
      required this.ortalama,
      super.key});

  @override
  Widget build(BuildContext context) {
    String ortalamaText = '0.00';
    if (100 > ortalama && ortalama > 0) {
      ortalamaText = ortalama.toStringAsFixed(2);
    } else if (ortalama == 100) {
      ortalamaText = ortalama.toStringAsFixed(1);
    } else {
      ortalamaText = '0.00';
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi Not Girildi' : '$bilgi Giriniz',
          style: Sabitler.paragraphStyle,
        ),
        Text(ortalamaText, style: Sabitler.NumberStyle),
        Text("Ortalama", style: Sabitler.paragraphStyle),
      ],
    );
  }
}
