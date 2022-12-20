import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/model/constants/app_constants.dart';

geriDonus(List list, BuildContext context) {
  return list.isNotEmpty
      ? showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Girdiğiniz bilgiler kaydedilsin mi?',
                style: Sabitler.alertBoxStyle,
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: Sabitler.myBorderRadius),
                          foregroundColor: Sabitler.ikinciRenk,
                          backgroundColor: Sabitler.anaRenk),
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                          context, '/Menu', (route) => false),
                      child: const Text('Evet'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: Sabitler.myBorderRadius),
                          foregroundColor: Sabitler.ikinciRenk,
                          backgroundColor: Sabitler.anaRenk),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/Menu', (route) => false);
                        list.clear();
                      },
                      child: const Text('Hayır'),
                    ),
                  ],
                )
              ],
            );
          },
        )
      : Navigator.pop(context);
}
