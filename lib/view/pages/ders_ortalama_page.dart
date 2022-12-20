import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/model/helper/data_helper.dart';
import 'package:UniversiteNotHesaplama/view/widgets/ortalama_goster_widget.dart';

import '../../model/constants/app_constants.dart';
import '../../model/sinav.dart';
import '../../viewModel/sınav_listesi.dart';
import '../widgets/geri_button_widget.dart';

class DersOrtalamaHesaplaPage extends StatefulWidget {
  const DersOrtalamaHesaplaPage({super.key});

  @override
  State<DersOrtalamaHesaplaPage> createState() =>
      _DersOrtalamaHesaplaPageState();
}

class _DersOrtalamaHesaplaPageState extends State<DersOrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  double sinavNotu = 0;
  double sinavYuzdesi = 0;
  String dersAdi = "";
  String sinavTuru = "Vize";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        geriDonus(DataHelper.tumEklenenSinavlar, context);
        return false;
      },
      child: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            geriDonus(DataHelper.tumEklenenSinavlar, context);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () =>
                  geriDonus(DataHelper.tumEklenenSinavlar, context),
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
              'Ders Ortalama Hesaplama',
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
                    child: _buildFormField(),
                  ),
                  Expanded(
                    child: OrtalamaGosterPage(
                      bilgi: 'Not',
                      dersSayisi: DataHelper.tumEklenenSinavlar.length,
                      ortalama: DataHelper.dersOrtalamasiHesapla(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    DataHelper.tumEklenenSinavlar.isNotEmpty
                        ? DataHelper.tumEklenenSinavlar[0].dersAdi
                        : '',
                    style: Sabitler.headerStyle,
                  ),
                ),
              ),
              Expanded(
                child: SinavListesi(
                  onElemanCikarildi: (index) {
                    DataHelper.tumEklenenSinavlar.removeAt(index);
                    if (DataHelper.tumEklenenSinavlar.isEmpty) {
                      dersAdi = "";
                    }
                    setState(() {});
                    if (DataHelper.tumEklenenSinavlar.isEmpty) {
                      formKey.currentState!.reset();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: Sabitler.myButtonBorderRadius),
                      side: const BorderSide(
                          width: 1.5, color: Sabitler.anaRenk)),
                  onPressed: () {
                    setState(
                      () {
                        DataHelper.tumEklenenSinavlar = [];
                        dersAdi = "";
                      },
                    );
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

  _buildFormField() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        dersAdi = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Değer Giriniz';
                      } else if (DataHelper.tumEklenenSinavlar.isNotEmpty
                          ? value != DataHelper.tumEklenenSinavlar[0].dersAdi
                          : value.isEmpty) {
                        return 'Ders adı aynı olmalıdır';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Ders Adı',
                      border: OutlineInputBorder(
                          borderRadius: Sabitler.myBorderRadius,
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Sabitler.anaRenk.shade100.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        sinavTuru = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Değer Giriniz';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Not Türü',
                      border: OutlineInputBorder(
                          borderRadius: Sabitler.myBorderRadius,
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Sabitler.anaRenk.shade100.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        sinavYuzdesi = double.parse(newValue!);
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Değer Giriniz';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Yüzde',
                      border: OutlineInputBorder(
                          borderRadius: Sabitler.myBorderRadius,
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Sabitler.anaRenk.shade100.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        sinavNotu = double.parse(newValue!);
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Değer Giriniz';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Not',
                      border: OutlineInputBorder(
                          borderRadius: Sabitler.myBorderRadius,
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Sabitler.anaRenk.shade100.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: _dersEkleVeOrtalamaHesapla,
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Sabitler.anaRenk,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekSinav = Sinav(
          dersAdi: dersAdi,
          sinavNotu: sinavNotu,
          sinavTuru: sinavTuru,
          sinavYuzdesi: sinavYuzdesi);
      DataHelper.sinavEkle(eklenecekSinav);
      setState(() {});
    }
  }
}
