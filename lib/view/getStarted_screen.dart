import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
//import 'package:holy_quran/view/homePage_screen.dart';

import '../constants.dart';
import 'homePage_screen.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';

class GetSatarted extends StatefulWidget {
  static const String id = "GetSatarted";
  @override
  _GetSatartedState createState() => _GetSatartedState();
}

class _GetSatartedState extends State<GetSatarted> {
  bool loading=true;
 // AssetsAudioPlayer _assetsAudioPlayer;


  AudioPlayer _advancedPlayer;
 // AudioCache _audioCache;

  @override
  void initState() {
    super.initState();
    _advancedPlayer=AudioPlayer();
   // _advancedPlayer.play("sound/sound.mp3");
    intiPlayer();
   Future.delayed( Duration(seconds: 2),(){
     setState(() {

       loading=false;
     });
   });

  }
  Future <void>intiPlayer()async{
    _advancedPlayer = await AudioCache().play("sound.mp3");

    //_advancedPlayer.play("sound.mp3");
  }

  @override
  void dispose() {
    _advancedPlayer = null;
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Center(
            child: Text(
              "Holy Quran",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Learn and read",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            "holy Quran every day",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.07),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    //    color: kMainColor
                    color:Colors.white
                ),
                height: MediaQuery.of(context).size.height * .6,
                width: MediaQuery.of(context).size.width * .8,
             child: AnimatedOpacity(opacity: loading?0.5:1, duration: Duration(seconds: 6), child: Image.asset(
               "images/q1.jpg",
               //fit: BoxFit.fill,
             ) ,),

             /*   child: Image.asset(
                  "images/q1.jpg",
                  //fit: BoxFit.fill,
                ),*/
              ),
              Positioned(
                bottom: 0,
                left: MediaQuery.of(context).size.width * .2,
                child: Container(
                  height: MediaQuery.of(context).size.height * .06,
                  width: MediaQuery.of(context).size.width * .4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.teal
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, HomePage.id);
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
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
}

