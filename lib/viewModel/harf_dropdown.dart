import 'package:flutter/material.dart';

import '../model/constants/app_constants.dart';
import '../model/helper/data_helper.dart';

class DropdownHarfWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const DropdownHarfWidget({required this.onHarfSecildi, super.key});

  @override
  State<DropdownHarfWidget> createState() => _DropdownHarfWidgetState();
}

double secilenHarf = 4;

class _DropdownHarfWidgetState extends State<DropdownHarfWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropdownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.myBorderRadius),
      child: DropdownButton(
        items: DataHelper.tumDerslerinHarfleri(),
        value: secilenHarf,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        underline: Container(),
        onChanged: (deger) {
          setState(() {
            secilenHarf = deger!.toDouble();
            widget.onHarfSecildi(secilenHarf);
          });
        },
      ),
    );
  }
}
