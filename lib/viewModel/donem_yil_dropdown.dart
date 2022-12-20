import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/model/constants/app_constants.dart';

class DonemYilDropdownWidget extends StatefulWidget {
  final Function onDonemSecildi;
  const DonemYilDropdownWidget({required this.onDonemSecildi, super.key});

  @override
  State<DonemYilDropdownWidget> createState() => _DonemYilDropdownWidgetState();
}

String secilenDonemYil = 'Dönem';

class _DonemYilDropdownWidgetState extends State<DonemYilDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.myBorderRadius),
      alignment: Alignment.center,
      child: DropdownButton(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        underline: Container(),
        value: secilenDonemYil,
        items: const [
          DropdownMenuItem(
            value: 'Dönem',
            child: Text('Dönem'),
          ),
          DropdownMenuItem(
            value: 'Yil',
            child: Text('Yil'),
          ),
        ],
        onChanged: (value) {
          setState(() {
            secilenDonemYil = value!;
            widget.onDonemSecildi(secilenDonemYil);
          });
        },
      ),
    );
  }
}
