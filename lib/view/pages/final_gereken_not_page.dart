import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/model/helper/data_helper.dart';

import '../../model/constants/app_constants.dart';
import '../../viewModel/final_not_listesi.dart';
import '../widgets/geri_button_widget.dart';

class FinalGerekenNotHesaplamaPage extends StatefulWidget {
  const FinalGerekenNotHesaplamaPage({super.key});

  @override
  State<FinalGerekenNotHesaplamaPage> createState() =>
      _FinalGerekenNotHesaplamaPageState();
}

class _FinalGerekenNotHesaplamaPageState
    extends State<FinalGerekenNotHesaplamaPage> {
  var formKey = GlobalKey<FormState>();
  double ortalama = 0;
  double yuzde = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        geriDonus(DataHelper.gecmekIcinGerekenNotlar, context);
        return false;
      },
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          if (details.delta.dx > 0) {
            geriDonus(DataHelper.gecmekIcinGerekenNotlar, context);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () =>
                  geriDonus(DataHelper.gecmekIcinGerekenNotlar, context),
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
              'Finalden kaç almam lazım?',
              style: Sabitler.headerStyle,
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: _buildForm(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FinalNotListesi(
                    onElemanGirildi: () {
                      setState(() {});
                    },
                  ),
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
                      DataHelper.gecmekIcinGerekenNotlar = [];
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

  _buildForm() {
    return Form(
      key: formKey,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onSaved: (newValue) {
                  setState(() {
                    yuzde = double.parse(newValue!);
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Bir sayı giriniz';
                  } else if (double.parse(value) > 100) {
                    return 'Ortalama 100 den büyük olamaz';
                  } else if (double.parse(value) < 0) {
                    return 'Ortalama 0 dan küçük olamaz';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Yüzdesi (%10)',
                  labelText: 'Yüzdesi',
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
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onSaved: (newValue) {
                  setState(() {
                    ortalama = double.parse(newValue!);
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Bir sayı giriniz';
                  } else if (double.parse(value) > 100) {
                    return 'Ortalama 100 den büyük olamaz';
                  } else if (double.parse(value) < 0) {
                    return 'Ortalama 0 dan küçük olamaz';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Ders Ortalaması',
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
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: kaydetVeHesapla,
                icon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Sabitler.anaRenk,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void kaydetVeHesapla() {
    DataHelper.gecmekIcinGerekenNotlar = [];
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      DataHelper.notlariHesapla(ortalama, yuzde);
      setState(() {});
    }
  }
}
