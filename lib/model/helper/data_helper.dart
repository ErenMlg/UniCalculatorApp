import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/model/donem.dart';
import 'package:UniversiteNotHesaplama/model/sinav.dart';

import '../ders.dart';

class DataHelper {
  static List<Ders> tumEklenenDersler = [];
  static List<Donem> tumEklenenDonemler = [];
  static List<Sinav> tumEklenenSinavlar = [];
  static List<double> gecemeNotlari = [
    50,
    55,
    60,
    65,
    70,
    75,
    80,
    85,
    90,
    95,
    100
  ];
  static List<double> gecmekIcinGerekenNotlar = [];

  static notlariHesapla(double ortalama, double yuzde) {
    double olmasiGereken = 0;
    double yuzdesiniHesapla = yuzde / 100;
    double araIslem = ortalama * (1 - yuzdesiniHesapla);
    for (int i = 0; i < gecemeNotlari.length; i++) {
      olmasiGereken = (gecemeNotlari[i] - araIslem) / yuzdesiniHesapla;
      if (olmasiGereken <= 100 && olmasiGereken >= 0) {
        gecmekIcinGerekenNotlar.add(olmasiGereken);
      } else {
        gecmekIcinGerekenNotlar.add(0);
      }
    }
  }

  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  static donemYilEkle(Donem donem) {
    tumEklenenDonemler.add(donem);
  }

  static sinavEkle(Sinav sinav) {
    double toplam = 0;
    bool kontrol = false;
    for (var eleman in tumEklenenSinavlar) {
      toplam += eleman.sinavYuzdesi;
      if (tumEklenenSinavlar.isNotEmpty) {
        if (sinav.dersAdi != eleman.dersAdi) {
          kontrol = true;
        }
      }
    }
    toplam += sinav.sinavYuzdesi;
    if (toplam <= 100 && toplam >= 0 && kontrol == false) {
      tumEklenenSinavlar.add(sinav);
    }
  }

  static double dersOrtalamasiHesapla() {
    double ortalama = 0;
    for (var deger in tumEklenenSinavlar) {
      ortalama += deger.sinavNotu * (deger.sinavYuzdesi / 100);
    }
    return ortalama;
  }

  static double genelOrtalamaHesapla() {
    double ortalama = 0;
    for (var deger in tumEklenenDonemler) {
      ortalama += deger.donemOrtalamasi;
    }
    return ortalama / tumEklenenDonemler.length;
  }

  static double donemOrtalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    for (var element in tumEklenenDersler) {
      toplamKredi += element.krediDegeri;
      toplamNot += (element.krediDegeri * element.harfDegeri);
    }

    return toplamNot / toplamKredi;
  }

  static final List<String> _tumDerslerinHarfNotlari = [
    'AA',
    'BA',
    'BB',
    'CB',
    'CC',
    'DC',
    'DD',
    'FD',
    'FF'
  ];

  static List<int> _tumKrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 0;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDerslerinHarfNotlari
        .map((e) => DropdownMenuItem(
              value: _harfiNotaCevir(e),
              child: Text(e),
            ))
        .toList();
  }

  static List<DropdownMenuItem<int>> tumDerslerinKredileri() {
    return _tumKrediler()
        .map((e) => DropdownMenuItem(
              value: e,
              child: Text(e.toString()),
            ))
        .toList();
  }
}
