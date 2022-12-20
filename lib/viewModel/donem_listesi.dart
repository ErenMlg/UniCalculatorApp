import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/model/helper/data_helper.dart';

import '../model/constants/app_constants.dart';
import '../model/donem.dart';

class DonemYilListesi extends StatefulWidget {
  final Function onElemanCikarildi;
  const DonemYilListesi({required this.onElemanCikarildi, super.key});

  @override
  State<DonemYilListesi> createState() => _DonemYilListesiState();
}

class _DonemYilListesiState extends State<DonemYilListesi> {
  @override
  Widget build(BuildContext context) {
    List<Donem> listelenecekDonemler = DataHelper.tumEklenenDonemler;
    return listelenecekDonemler.isNotEmpty
        ? ListView.builder(
            itemCount: listelenecekDonemler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                onDismissed: (direction) {
                  widget.onElemanCikarildi(index);
                },
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    elevation: 0.5,
                    shadowColor: Sabitler.anaRenk.shade100,
                    child: ListTile(
                      title: Text(listelenecekDonemler[index].donemAdi),
                      subtitle: Text(
                        "${listelenecekDonemler[index].yilMiDonemMi} Ortalama : ${listelenecekDonemler[index].donemOrtalamasi.toStringAsFixed(2)}",
                      ),
                      leading: const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Sabitler.anaRenk,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text(
              "Lütfen Dönem Ekleyiniz...",
              style: Sabitler.headerStyle,
            ),
          );
  }
}
