import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/model/constants/app_constants.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            Sabitler.menuHeaderText,
            style: Sabitler.menuHeaderStyle,
          ),
          backgroundColor: Sabitler.anaRenk,
          centerTitle: true,
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/arkaPlan.png"), fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/GenelOrtalamaHesapla');
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: Sabitler.myBorderRadius),
                        foregroundColor: Sabitler.anaRenk,
                        backgroundColor: Sabitler.ikinciRenk,
                        side: const BorderSide(
                            width: 4, color: Sabitler.anaRenk)),
                    icon: const Icon(
                      Icons.calculate_rounded,
                      size: 40,
                    ),
                    label: const Text(
                      'Genel Ortalama Hesaplama',
                      textAlign: TextAlign.center,
                      style: Sabitler.buttonTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/DonemOrtalamaHesapla');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Sabitler.anaRenk,
                      shape: RoundedRectangleBorder(
                          borderRadius: Sabitler.myBorderRadius),
                      backgroundColor: Sabitler.ikinciRenk,
                      side: const BorderSide(
                        width: 4,
                        color: Sabitler.anaRenk,
                      ),
                    ),
                    icon: const Icon(
                      Icons.assignment_rounded,
                      size: 40,
                    ),
                    label: const Text(
                      'Dönem Ortalama Hesaplama',
                      textAlign: TextAlign.center,
                      style: Sabitler.buttonTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/DersOrtalamaHesapla');
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: Sabitler.myBorderRadius),
                        foregroundColor: Sabitler.anaRenk,
                        backgroundColor: Sabitler.ikinciRenk,
                        side: const BorderSide(
                            width: 4, color: Sabitler.anaRenk)),
                    icon: const Icon(
                      Icons.collections_bookmark_rounded,
                      size: 40,
                    ),
                    label: const Text(
                      'Ders Ortalama Hesaplama',
                      textAlign: TextAlign.center,
                      style: Sabitler.buttonTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/GecmeNotuHesapla');
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: Sabitler.myBorderRadius),
                        foregroundColor: Sabitler.anaRenk,
                        backgroundColor: Sabitler.ikinciRenk,
                        side: const BorderSide(
                            width: 4, color: Sabitler.anaRenk)),
                    icon: const Icon(
                      Icons.question_mark_outlined,
                      size: 40,
                    ),
                    label: const Text(
                      'Finalden Kaç Almam Lazim?',
                      textAlign: TextAlign.center,
                      style: Sabitler.buttonTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}


/* 

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: Text(
              Sabitler.menuHeaderText,
              style: Sabitler.headerStyle,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(4, 4, 2, 2),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      textStyle: Sabitler.buttonTextStyle,
                      padding: const EdgeInsets.symmetric(vertical: 80),
                      side: const BorderSide(width: 2, color: Sabitler.anaRenk),
                    ),
                    child: const Text(
                      'Dönem Ortalaması\nHesaplama',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(2, 4, 4, 2),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      textStyle: Sabitler.buttonTextStyle,
                      padding: const EdgeInsets.symmetric(vertical: 80),
                      side: const BorderSide(width: 2, color: Sabitler.anaRenk),
                    ),
                    child: const Text(
                      'Genel Ortalama\nHesaplama',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(4, 2, 2, 4),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      textStyle: Sabitler.buttonTextStyle,
                      padding: const EdgeInsets.symmetric(vertical: 80),
                      side: const BorderSide(width: 2, color: Sabitler.anaRenk),
                    ),
                    child: const Text(
                      'Ders Ortalaması\nHesaplama',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(2, 2, 4, 4),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      textStyle: Sabitler.buttonTextStyle,
                      padding: const EdgeInsets.symmetric(vertical: 80),
                      side: const BorderSide(width: 2, color: Sabitler.anaRenk),
                    ),
                    child: const Text(
                      'Final Büt Kaç Almam\nLazım',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      */