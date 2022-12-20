import 'package:flutter/material.dart';

import '../model/constants/app_constants.dart';
import '../model/helper/data_helper.dart';

class DropdownKrediWidget extends StatefulWidget {
  Function onKrediSecildi;
  DropdownKrediWidget({required this.onKrediSecildi, super.key});

  @override
  State<DropdownKrediWidget> createState() => DropdownKrediWidgetState();
}

int secilenKredi = 4;

class DropdownKrediWidgetState extends State<DropdownKrediWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropdownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.myBorderRadius),
      child: DropdownButton(
        items: DataHelper.tumDerslerinKredileri(),
        value: secilenKredi,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        underline: Container(),
        onChanged: (deger) {
          setState(() {
            secilenKredi = deger!.toInt();
            widget.onKrediSecildi(secilenKredi);
          });
        },
      ),
    );
  }
}
