import 'package:UniversiteNotHesaplama/model/yardim_arguments.dart';
import 'package:UniversiteNotHesaplama/view/pages/yardim_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/view/pages/ders_ortalama_page.dart';
import 'package:UniversiteNotHesaplama/view/pages/donem_ortalama_page.dart';
import 'package:UniversiteNotHesaplama/view/pages/final_gereken_not_page.dart';
import 'package:UniversiteNotHesaplama/view/pages/genel_ortalama_page.dart';
import 'package:UniversiteNotHesaplama/view/pages/menu_page.dart';

class MyRouteGenerator {
  static Route? routeDondurucu(
      Widget gidilecekSayfa, RouteSettings gelenSettings) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
        settings: gelenSettings,
        builder: (context) => gidilecekSayfa,
      );
    } else {
      return MaterialPageRoute(
        settings: gelenSettings,
        builder: (context) => gidilecekSayfa,
      );
    }
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return routeDondurucu(const MenuPage(), settings);

      case '/DonemOrtalamaHesapla':
        return routeDondurucu(const DonemOrtalamaHesaplaPage(), settings);

      case '/GenelOrtalamaHesapla':
        return routeDondurucu(const GenelOrtalamaHesaplaPage(), settings);

      case '/DersOrtalamaHesapla':
        return routeDondurucu(const DersOrtalamaHesaplaPage(), settings);

      case '/GecmeNotuHesapla':
        return routeDondurucu(const FinalGerekenNotHesaplamaPage(), settings);

      case '/Yardim':
        var args = settings.arguments as YardimArguments;
        return routeDondurucu(
            YardimPage(
              yardimMessage: args.mesaj,
              mesajSize: args.mesajBoyu,
              vurguSize: args.error,
            ),
            settings);
    }
    return null;
  }
}
