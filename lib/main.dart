import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/model/constants/app_constants.dart';
import 'package:UniversiteNotHesaplama/model/helper/routeGenerator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: MyRouteGenerator.routeGenerator,
      title: 'Üniversite Ortalama Hesaplama',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity
            .adaptivePlatformDensity, // diğer ortamlarda o ortama uygun görünmesini sağlamak
      ),
    );
  }
}
