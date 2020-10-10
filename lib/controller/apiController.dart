import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiController {
  /////////////////////////////////////
  Future<List> getData() async {
    http.Response response =
        await http.get('http://api.alquran.cloud/v1/quran/quran-uthmani');
    var data = response.body;
    List surahs = new List(114);
    for (int i = 0; i <= data.length; i++) {
      var surah = jsonDecode(data)['data']['surahs'][i]['name'];
      //print(surah);
      //surahs.add(surah);
      surahs[i] = surah;
    }
    return surahs;
  }
}

//data.surahs[0].name
/*
for (int i = 0; i <= data.length; i++) {
      var surah = jsonDecode(data)['data']['surahs'][i]['name'];
      print(surah);
    }



    Future<List<dynamic>> getData() async {
    http.Response response =
        await http.get('http://api.alquran.cloud/v1/quran/quran-uthmani');
    var data = response.body;
    List<String> surahs;
    for (int i = 0; i <= data.length; i++) {
      var surah = jsonDecode(data)['data']['surahs'][i]['name'];
      surahs.add(surah);
    }
    return surahs;
  }
  */
