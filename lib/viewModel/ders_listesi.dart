import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/model/constants/app_constants.dart';
import 'package:UniversiteNotHesaplama/model/helper/data_helper.dart';
import '../model/ders.dart';

class DersListesi extends StatefulWidget {
  final Function onElemanCikarildi;

  const DersListesi({required this.onElemanCikarildi, super.key});

  @override
  State<DersListesi> createState() => _DersListesiState();
}

class _DersListesiState extends State<DersListesi> {
  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key:
                    UniqueKey(), // Listedeki her elemana birbirinden farklı keyler atar.
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  widget.onElemanCikarildi(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    elevation: 0.5,
                    shadowColor: Sabitler.anaRenk.shade100,
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      subtitle: Text(
                          "${tumDersler[index].krediDegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri}"),
                      leading: CircleAvatar(
                        child: Text(
                          (tumDersler[index].harfDegeri *
                                  tumDersler[index].krediDegeri)
                              .toStringAsFixed(0),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text(
              "Lütfen Ders Ekleyiniz...",
              style: Sabitler.emptyListStyle,
            ),
          );
  }
}
