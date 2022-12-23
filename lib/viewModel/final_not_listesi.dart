import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/model/constants/app_constants.dart';
import 'package:UniversiteNotHesaplama/model/helper/data_helper.dart';

class FinalNotListesi extends StatefulWidget {
  Function onElemanGirildi;
  FinalNotListesi({required this.onElemanGirildi,super.key});

  @override
  State<FinalNotListesi> createState() => _FinalNotListesiState();
}

class _FinalNotListesiState extends State<FinalNotListesi> {
  @override
  Widget build(BuildContext context) {
    return DataHelper.gecmekIcinGerekenNotlar.isNotEmpty
        ? ListView.builder(
            itemCount: 11,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: ListTile(
                    title: Text(
                      "Ortalamanızın ${DataHelper.gecemeNotlari[index].toStringAsFixed(0)} olması için almanız gereken not",
                      textAlign: TextAlign.center,
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        DataHelper.gecmekIcinGerekenNotlar[index] == 0
                            ? 'Yetersiz'
                            : DataHelper.gecmekIcinGerekenNotlar[index]
                                .toStringAsFixed(2),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Sabitler.anaRenk),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Lütfen Final Sınavınızın Yüzdesini ve Dersinizin Şuanki Ortalamasını Giriniz',
                textAlign: TextAlign.center,
                style: Sabitler.emptyListStyle,
              ),
            ),
          );
  }
}
