import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/model/sinav.dart';

import '../model/constants/app_constants.dart';
import '../model/helper/data_helper.dart';

class SinavListesi extends StatefulWidget {
  final Function onElemanCikarildi;
  const SinavListesi({required this.onElemanCikarildi, super.key});

  @override
  State<SinavListesi> createState() => _SinavListesiState();
}

class _SinavListesiState extends State<SinavListesi> {
  @override
  Widget build(BuildContext context) {
    List<Sinav> listelenecekSinavlar = DataHelper.tumEklenenSinavlar;
    return listelenecekSinavlar.isNotEmpty
        ? ListView.builder(
            itemCount: listelenecekSinavlar.length,
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
                      title: Text(listelenecekSinavlar[index].sinavTuru),
                      subtitle: Text(
                        "%${listelenecekSinavlar[index].sinavYuzdesi} Etkili, Not : ${listelenecekSinavlar[index].sinavNotu}",
                      ),
                      leading: CircleAvatar(
                        child: Text((listelenecekSinavlar[index].sinavNotu *
                                    listelenecekSinavlar[index].sinavYuzdesi /
                                    100) ==
                                100
                            ? (listelenecekSinavlar[index].sinavNotu *
                                    listelenecekSinavlar[index].sinavYuzdesi /
                                    100)
                                .toStringAsFixed(0)
                            : (listelenecekSinavlar[index].sinavNotu *
                                    listelenecekSinavlar[index].sinavYuzdesi /
                                    100)
                                .toStringAsFixed(1)),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text(
              "Lütfen Sınav Ekleyiniz...",
              style: Sabitler.headerStyle,
            ),
          );
  }
}
