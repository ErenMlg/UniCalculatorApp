import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/model/constants/app_constants.dart';
import 'package:UniversiteNotHesaplama/model/helper/data_helper.dart';
import 'package:UniversiteNotHesaplama/model/ders.dart';
import 'package:UniversiteNotHesaplama/viewModel/ders_listesi.dart';
import 'package:UniversiteNotHesaplama/viewModel/harf_dropdown.dart';
import 'package:UniversiteNotHesaplama/viewModel/kredi_dropdown.dart';
import 'package:UniversiteNotHesaplama/view/widgets/ortalama_goster_widget.dart';

import '../widgets/geri_button_widget.dart';

class DonemOrtalamaHesaplaPage extends StatefulWidget {
  const DonemOrtalamaHesaplaPage({super.key});

  @override
  State<DonemOrtalamaHesaplaPage> createState() =>
      _DonemOrtalamaHesaplaPageState();
}

class _DonemOrtalamaHesaplaPageState extends State<DonemOrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  late String dersAdi = '';
  double secilenHarf = 4;
  int secilenKredi = 4;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        geriDonus(DataHelper.tumEklenenDersler, context);
        return false;
      },
      child: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            geriDonus(DataHelper.tumEklenenDersler, context);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => geriDonus(DataHelper.tumEklenenDersler, context),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.question_mark),
              ),
            ],
            iconTheme: Sabitler.backButtonTheme,
            elevation: 0,
            title: Text(
              'Dönem Ortalama Hesaplama',
              textAlign: TextAlign.center,
              style: Sabitler.headerStyle,
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: _buildForm(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: OrtalamaGosterPage(
                        bilgi: "Ders",
                        dersSayisi: DataHelper.tumEklenenDersler.length,
                        ortalama: DataHelper.donemOrtalamaHesapla(),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: DersListesi(
                  onElemanCikarildi: (index) {
                    DataHelper.tumEklenenDersler.removeAt(index);
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: Sabitler.myButtonBorderRadius),
                      side: const BorderSide(
                          width: 1.5, color: Sabitler.anaRenk)),
                  onPressed: () {
                    setState(() {
                      DataHelper.tumEklenenDersler = [];
                      formKey.currentState!.reset();
                    });
                  },
                  child: const Text('Listeyi Sıfırla'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.outlinePadding,
            child: _buildTextFormField(),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.outlinePadding,
                  child: DropdownHarfWidget(onHarfSecildi: (gelenHarfDegeri) {
                    secilenHarf = gelenHarfDegeri;
                  }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.outlinePadding,
                  child:
                      DropdownKrediWidget(onKrediSecildi: (gelenKrediDegeri) {
                    secilenKredi = gelenKrediDegeri;
                  }),
                ),
              ),
              IconButton(
                onPressed: _dersEkleVeOrtalamaHesapla,
                icon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Sabitler.anaRenk,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          dersAdi = deger!;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ders adını giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Ders Giriniz',
        border: OutlineInputBorder(
            borderRadius: Sabitler.myBorderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.2),
      ),
    );
  }

  void _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers =
          Ders(ad: dersAdi, harfDegeri: secilenHarf, krediDegeri: secilenKredi);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
