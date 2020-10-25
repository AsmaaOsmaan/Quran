
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled3/models/surah.dart';
import 'package:untitled3/models/surahs.dart';


class Api{
  String Main_Url="http://api.alquran.cloud/v1/quran/quran-uthmani";
  Map<String, String> headers = {'accept': 'application/json',};
  Future<List<Surah>> getData() async {
    List<Surah>suraas=[];
try{
  http.Response response = await http.get(Main_Url);

 print(response.statusCode);
 if(response.statusCode==200){
   String data=response.body;
   var jsonData=jsonDecode(data);
  // print(jsonData);
   Surahs surahs=Surahs.fromjson(jsonData);
   print("***********************************");
   print("*aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa*");
   //print(surahs);
  // print(surahs.surah);
  // print(surahs.surah.);
suraas=  surahs.surah.map((e)=>Surah.fromjson(e)).toList();

 return suraas;

 }
 else{
     print("response code${response.statusCode}") ;
 }

}
catch(ex){
  print(ex);
}
  }
  Future<List<Surah>> getJuza(int index) async {
    List<Surah>suraas=[];
    List<Surah>suraas2=[];
    try{
      http.Response response = await http.get(Main_Url);
      print(response.statusCode);
      if(response.statusCode==200){
        String data=response.body;
        var jsonData=jsonDecode(data);
        // print(jsonData);
        Surahs surahs=Surahs.fromjson(jsonData);
        print("***********************************");
        print("*aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa*");
        //print(surahs);
        // print(surahs.surah);
        // print(surahs.surah.);
        suraas=  surahs.surah.map((e)=>Surah.fromjson(e)).toList();
        for (var item in suraas){
          for(int inde=0;inde<=item.ayahs.length-1;inde++){
          if(item.ayahs[inde]['juz']==index){
            if(suraas2.contains(item)==false)
            suraas2.add(item);
            //2.3.5.6.7.11.17.20.
            //5.7.6.
          }
          }
        /*  if(item.ayahs[1]['juz']==index){
            suraas2.add(item);
          }*/
        }
        return suraas2;

      }
      else{
        print("response code${response.statusCode}") ;
      }
    }
    catch(ex){
      print(ex);
    }
  }


}