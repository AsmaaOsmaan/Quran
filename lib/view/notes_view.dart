import 'package:flutter/material.dart';
import 'package:untitled3/controller/services/api.dart';
import 'package:untitled3/models/arguments.dart';
import 'package:untitled3/models/surah.dart';

import 'Ayat_view.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
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
            return Center(child: Text('no data'),);
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


/*
class Expansionpanel extends StatefulWidget {
  Expansionpaneltate createState() =>  Expansionpaneltate();
}
class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  final Icon iconpic;
  NewItem(this.isExpanded, this.header, this.body, this.iconpic);
}
class Expansionpaneltate extends State<Expansionpanel> {
  List<NewItem> items = <NewItem>[
    NewItem(
        false, // isExpanded ?
        'Header', // header
        Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
                children: <Widget>[
                  Text('data'),
                  Text('data'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('data'),
                      Text('data'),
                      Text('data'),
                    ],
                  ),
                  Radio(value: null, groupValue: null, onChanged: null)
                ]
            )
        ), // body
        Icon(Icons.image) // iconPic
    ),
  ];
  ListView List_Criteria;
  Widget build(BuildContext context) {
    List_Criteria = ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                items[index].isExpanded = !items[index].isExpanded;
              });
            },
            children: items.map((NewItem item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return  ListTile(
                      leading: item.iconpic,
                      title:  Text(
                        item.header,
                        textAlign: TextAlign.left,
                        style:  TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                  );
                },
                isExpanded: item.isExpanded,
                body: item.body,
              );
            }).toList(),
          ),
        ),
      ],
    );
    Scaffold scaffold =  Scaffold(
      appBar:  AppBar(
        title:  Text("ExpansionPanelList"),
      ),
      body: List_Criteria,
    );
    return scaffold;
  }
}
*/