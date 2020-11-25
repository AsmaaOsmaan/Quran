import 'package:flutter/material.dart';
import 'package:untitled3/controller/services/api.dart';
import 'package:untitled3/models/EpansionModel.dart';
import 'package:untitled3/models/arguments.dart';
import 'package:untitled3/models/surah.dart';

import 'Ayat_view.dart';

class juzaView extends StatefulWidget {
  @override
  _juzaViewState createState() => _juzaViewState();

}

class _juzaViewState extends State<juzaView> {
  List<String>juza=["الاول","الثانى ","لتالت","الرابع ","الخامس","السادس ","السابع","التامن ","التاسع ","العاشر ","الاحد عشر","الثانى عشر ","الثالث عشر ","الرابع عشر ","الخامس عشر","السادس عشر ","السابع عشر","الثامن عشر ","التاسع عشر","العشرون ","الواحد والعشرون","الثانى والعشرون","الثالث والعشرون","الرابع والعشرون","الخامس والعشرون","السادس والعشرون","السابع والعشرون","الثامن والعشرون","التاسع والعشرون","الثلاوثون"];
  Api api=Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView.builder(
        itemCount: juza.length,
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: <Widget>[
                SizedBox(height:20.0),
                ExpansionTile(
                  title: Text(
                    "الجزء${index+1}",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  children: <Widget>[
                    FutureBuilder(future:api.getJuza(index+1) ,builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: <Widget>[
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                List<Surah>ss=snapshot.data;
                                //for (int i = 0; i <= surahsNames.length; i++)
                                return Container(
                                  height: 70,
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context, AyatView.id,arguments:ScreenArguments(ss[index].number,ss[index].englishName,ss[index].name,ss[index].ayahs) );
                                    },
                                    child: Card(

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[

                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              new  Text("${ss[index].englishName}",
                                                  style: new TextStyle(fontSize: 18, color: Colors.blue)),
                                              SizedBox(height: 5,),
                                              new  Text("${ss[index].englishNameTranslation}",

                                                  style: new TextStyle(fontSize: 13.9, color: Colors.blue)),
                                            ],
                                          ),
                                          Text("${ss[index].revelationType}",
                                              style: new TextStyle(fontSize:15, color: Colors.blueGrey)),

                                          Text("${ss[index].name}",
                                              style: new TextStyle(fontSize:18, color: Colors.teal)),
                                        ],
                                      ),
                                    ),
                                  ),
                                );


                                /*ListTile(

                    title: Text("${ss[index].name}",
                        style: new TextStyle(fontSize: 13.9, color: Colors.teal)),
                    leading:  Column(
                        children: <Widget>[
                          new  Text("${ss[index].englishName}",
                              style: new TextStyle(fontSize: 13.9, color: Colors.blue)),
                          new  Text("${ss[index].englishNameTranslation}",
                              style: new TextStyle(fontSize: 13.9, color: Colors.blue)),
                        ],
                      ),


                    onTap: () {},
                  );*/
                              },
                            ),
                          ],
                        );
                      } else {
                        return Center(child: Text('Loading...'),);
                      }
                    } ,
                    ),
                    /*  ListTile(
                      title: Text(
                          'data'
                      ),
                    )*/
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }


}
List<Epansion>GeeratJuza(int number){
  return List.generate(number, (index){
    return  Epansion (
        juza: 'juza ${index}'
    );


  });
}
