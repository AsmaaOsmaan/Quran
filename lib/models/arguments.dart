import 'package:untitled3/models/surah.dart';

import 'ayahs.dart';

class ScreenArguments {
  // final Category title;
  // final int index;
//final List <Surah>suraha;
  final int surahNumberl;

  final String arabicName;
  final String englishName;
  final List<dynamic> ayatsList;
  //final int numberInSurah;

  ScreenArguments(
      this.surahNumberl, this.arabicName, this.englishName, this.ayatsList);
  //creenArguments(this.suraha);
}
