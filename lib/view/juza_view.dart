import 'package:flutter/material.dart';
import 'package:untitled3/models/EpansionModel.dart';

class juzaView extends StatefulWidget {
  @override
  _juzaViewState createState() => _juzaViewState();

}

class _juzaViewState extends State<juzaView> {
  List<String>juza=["الاول","الثانى ","لتالت","الرابع ","الخامس","السادس ","السابع","التامن ","التاسع ","العاشر ","الاحد عشر","الثانى عشر ","الثالث عشر ","الرابع عشر ","الخامس عشر","السادس عشر ","السابع عشر","الثامن عشر ","التاسع عشر","العشرون "];
  List<Epansion>_Exp=GeeratJuza(30);
  Widget builtEpansion(){
    return    ExpansionPanelList(
      expansionCallback: (int index,bool isExpanded){
        setState(() {
          _Exp[index] !=isExpanded;
        });
      },
      children:_Exp.map<ExpansionPanel>((Epansion juz){
        return ExpansionPanel(
          headerBuilder: (BuildContext contxt ,bool isExpanded ){
            return ListTile(
              title: Text(juz.juza),
            );
          },
          body: ListTile(
            title: Text("******"),
          ),
        );
      }) .toList(),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(

     children: <Widget>[Column(
       mainAxisSize: MainAxisSize.min,
       children: <Widget>[
         builtEpansion(),
         /*  ExpansionPanelList(
              expansionCallback: (int index,bool isExpanded){
                setState(() {
           juza [1]="hgh";
                });
              },
              children:juza.map<ExpansionPanel>((String txt){
return ExpansionPanel(
  headerBuilder: (BuildContext contxt ,bool isExpanded ){
    return ListTile(
            title: Text("juza"),
    );
  },
  body: Text("test"),
);
              }) .toList(),
            ),*/
       ],
     ),],
      )





      /*  ListView.builder(
      itemCount: juza.length,
      itemBuilder: (context, index) {
        return ListTile(
         //   trailing: Text("juza${index+1}"),
         // title: Text("الجزء ${juza[index]}"),
          trailing: Text("الجزء ${juza[index]}"),
          title: Text("juza${index+1}"),
        );
      },
    ),*/
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
