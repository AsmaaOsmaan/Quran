import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:holy_quran/view/getStarted_screen.dart';

import '../constants.dart';
import 'getStarted_screen.dart';

class SplashScreen extends StatefulWidget {
  static const id = "SplashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 5),
        () => Navigator.pushNamed(context, GetSatarted.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: kMainColor,
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .4,
              height: MediaQuery.of(context).size.height * .2,
              child: Image.asset(
                "images/splash.jpg",
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
