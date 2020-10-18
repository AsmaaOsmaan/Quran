
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
   print(jsonData);
   Surahs surahs=Surahs.fromjson(jsonData);
   print("***********************************");
   print("*aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa*");
   print(surahs);
   print(surahs.surah);
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



}