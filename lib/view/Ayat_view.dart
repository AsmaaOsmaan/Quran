import 'package:flutter/material.dart';
import 'package:untitled3/models/arguments.dart';
import 'package:untitled3/models/ayahs.dart';
import 'package:untitled3/models/surah.dart';

class AyatView extends StatefulWidget {
  static const id = 'AyatView';
  @override
  _AyatViewState createState() => _AyatViewState();
}

class _AyatViewState extends State<AyatView> {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
appBar: AppBar(title: Text("Ayat"),),
      body:ListView.builder(
        itemCount: args.ayatsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${args.ayatsList[index]['text']}'),
          );
        },
      ) );


      /*FutureBuilder(future: ,builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
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
          );
        } else {
          return Center(child: Text('no data'),);
        }
      } ,
      )*/

    /*  Container(

        child: Text("${args.ayatsList}")
       // child:ayat(context,args.ayatsList),
      ),*/



  }
  Widget ayat(BuildContext context,List<dynamic> ss){
    print(ss.length);
    for(int index=1;index<=ss.length;index++ ){
     print(ss[index]['text']);


      return Text("${ss[index]['text']}");
    }
  }
}
