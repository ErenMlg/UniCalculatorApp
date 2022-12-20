import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/view/pages/ders_ortalama_page.dart';
import 'package:UniversiteNotHesaplama/view/pages/donem_ortalama_page.dart';
import 'package:UniversiteNotHesaplama/view/pages/final_gereken_not_page.dart';
import 'package:UniversiteNotHesaplama/view/pages/genel_ortalama_page.dart';
import 'package:UniversiteNotHesaplama/view/pages/menu_page.dart';

import '../../view/pages/loading_page.dart';

class MyRouteGenerator {
  static Route? routeDondurucu(Widget gidilecekSayfa) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
        builder: (context) => gidilecekSayfa,
      );
    } else {
      return MaterialPageRoute(
        builder: (context) => gidilecekSayfa,
      );
    }
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return routeDondurucu(const SplashScreen());

      case '/Menu':
        return routeDondurucu(const MenuPage());

      case '/DonemOrtalamaHesapla':
        return routeDondurucu(const DonemOrtalamaHesaplaPage());

      case '/GenelOrtalamaHesapla':
        return routeDondurucu(const GenelOrtalamaHesaplaPage());

      case '/DersOrtalamaHesapla':
        return routeDondurucu(const DersOrtalamaHesaplaPage());

      case '/GecmeNotuHesapla':
        return routeDondurucu(const FinalGerekenNotHesaplamaPage());
    }
    return null;
  }
}
