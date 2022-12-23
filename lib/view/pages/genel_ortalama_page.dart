import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/model/donem.dart';
import '../../model/constants/app_constants.dart';
import '../../model/helper/data_helper.dart';
import '../../model/yardim_arguments.dart';
import '../../viewModel/donem_listesi.dart';
import '../../viewModel/donem_yil_dropdown.dart';
import '../widgets/geri_button_widget.dart';
import '../widgets/ortalama_goster_widget.dart';

class GenelOrtalamaHesaplaPage extends StatefulWidget {
  const GenelOrtalamaHesaplaPage({super.key});

  @override
  State<GenelOrtalamaHesaplaPage> createState() =>
      _GenelOrtalamaHesaplaPageState();
}

class _GenelOrtalamaHesaplaPageState extends State<GenelOrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  String girilenDonemAdi = '';
  String secilenDonemYil = 'Dönem';
  double girilenDonemOrtalamasi = 0;
  List<String> yardimMessage = [
    "Dönem veya yıl adını giriniz\n(1.Sınıf, 2.Sınıf 1.Dönem vb.)",
    "Gireceğiniz notun dönem mi yıl mı olduğunu seçiniz",
    "Notunuzu 3.45 şeklinde nokta ile giriniz",
    "Ok ikonuna basınız",
  ];
  int mesajBoyutu = 4;
  int onemliBoyut = 4;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        geriDonus(DataHelper.tumEklenenDonemler, context);
        return false;
      },
      child: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            geriDonus(DataHelper.tumEklenenDonemler, context);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () =>
                  geriDonus(DataHelper.tumEklenenDonemler, context),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Yardim',
                      arguments: YardimArguments(
                          mesaj: yardimMessage,
                          mesajBoyu: mesajBoyutu,
                          error: onemliBoyut));
                },
                icon: const Icon(Icons.question_mark),
              ),
            ],
            iconTheme: Sabitler.backButtonTheme,
            elevation: 0,
            title: Text(
              'Genel Ortalama Hesaplama',
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
                        bilgi: "Dönem",
                        dersSayisi: DataHelper.tumEklenenDonemler.length,
                        ortalama: DataHelper.genelOrtalamaHesapla(),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: DonemYilListesi(
                  onElemanCikarildi: (index) {
                    DataHelper.tumEklenenDonemler.removeAt(index);
                    setState(() {});
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
                    setState(() {
                      formKey.currentState!.reset();
                      DataHelper.tumEklenenDonemler = [];
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

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 4, 4),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Dönem adını giriniz';
                } else {
                  return null;
                }
              },
              onSaved: (newValue) {
                setState(() {
                  girilenDonemAdi = newValue!;
                });
              },
              decoration: InputDecoration(
                hintText: 'Dönem Adı',
                border: OutlineInputBorder(
                    borderRadius: Sabitler.myBorderRadius,
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Sabitler.anaRenk.shade100.withOpacity(0.2),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: DonemYilDropdownWidget(
                  onDonemSecildi: (gelenYilDonemDegeri) {
                    secilenDonemYil = gelenYilDonemDegeri!;
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                  child: TextFormField(
                    validator: (value) {
                      double deger = double.parse(value!);
                      if (deger > 4) {
                        return 'Ortalama 4den büyük olamaz';
                      } else if (deger < 0) {
                        return 'Ortalama 0dan küçük olamaz';
                      } else if (value.isEmpty) {
                        return 'Lütfen Doldurunuz';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      setState(() {
                        girilenDonemOrtalamasi = double.parse(newValue!);
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Not',
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
                  padding: const EdgeInsets.fromLTRB(16, 4, 4, 4),
                  child: IconButton(
                    onPressed: _donemEkleVeOrtalamaHesapla,
                    icon: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Sabitler.anaRenk,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _donemEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDonem = Donem(
          donemAdi: girilenDonemAdi,
          donemOrtalamasi: girilenDonemOrtalamasi,
          yilMiDonemMi: secilenDonemYil);
      DataHelper.donemYilEkle(eklenecekDonem);
      setState(() {});
    }
  }
}
