import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:UniversiteNotHesaplama/model/constants/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushReplacementNamed(context, '/Menu');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Sabitler.anaRenk,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextLiquidFill(
              text: 'Üniversite Not Hesaplama',
              waveColor: Sabitler.ikinciRenk,
              textStyle: Sabitler.menuHeaderStyle,
              waveDuration: const Duration(seconds: 2),
              loadDuration: const Duration(seconds: 2),
              boxBackgroundColor: Sabitler.anaRenk,
            )
          ],
        ));
  }
}
