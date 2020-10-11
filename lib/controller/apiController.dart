import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiController {
  /////////////////////////////////////
  Future<List> getData() async {
    Map<String, String> header = {"HttpHeaders.contentTypeHeader":"application/json"};
String url='http://api.alquran.cloud/v1/quran/quran-uthmani';
    http.Response response =
        await http.get(url, headers: header);

    var data = response.body;
    print("body");
  //  List surahs = new List(114);
    List <String>surahss =[];
    for (int i = 1; i <= data.length; i++) {
     String surah = jsonDecode(data)['data']['surahs'][i]['name'];
      print(surah);
     surahss.add(surah);
   //  surahss[i] = surah;
    }
    print("**************************");
    print("**************************");
    print("**************************");
    print("**************************");
    //print(surahs);
    return surahss;
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
