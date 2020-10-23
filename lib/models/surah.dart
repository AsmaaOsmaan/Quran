import 'dart:convert';

import 'ayahs.dart';

class Surah {
  String name;
  int number;
  String englishName;
  String englishNameTranslation;
  String revelationType;
  List<dynamic> ayahs;

  Surah(this.name, this.number, this.englishName, this.englishNameTranslation,
      this.revelationType, this.ayahs);
  Surah.fromjson(Map<String, dynamic> jsonObject) {
    this.number = jsonObject['number'];
    this.name = jsonObject['name'];
    this.englishName = jsonObject['englishName'];
    this.englishNameTranslation = jsonObject['englishNameTranslation'];
    this.revelationType = jsonObject['revelationType'];

    this.ayahs = jsonObject['ayahs'];
  }

  int get numberInSurah => null;
}
