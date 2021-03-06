import 'package:flutter/material.dart';
import 'package:untitled3/view/Ayat_view.dart';
import 'package:untitled3/view/home.dart';
import 'package:untitled3/view/surahIndex.dart';
import 'package:untitled3/view/homeScreen.dart';
//import 'package:holy_quran/view/homePage_screen.dart';
import 'view/getStarted_screen.dart';
import 'view/homePage_screen.dart';
import 'view/splash_screen.dart';

void main() {
  runApp(HolyQuran());
}

class HolyQuran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(canvasColor: Colors.orange.shade200),
      initialRoute: SplashScreen.id,
      routes: {
        GetSatarted.id: (context) => GetSatarted(),
        SplashScreen.id: (context) => SplashScreen(),
        HomePage.id: (context) => HomePage(),
        Home.id: (context) => Home(),
        AyatView.id: (context) => AyatView(),


        SurahIndex.id: (context) => SurahIndex(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
