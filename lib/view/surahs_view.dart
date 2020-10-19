import 'package:flutter/material.dart';
import 'package:untitled3/controller/services/api.dart';
import 'package:untitled3/models/surah.dart';

class surhView extends StatefulWidget {
  @override
  _surhViewState createState() => _surhViewState();
}

class _surhViewState extends State<surhView> {
  Api api=Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future:api.getData() ,builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              List<Surah>ss=snapshot.data;
              //for (int i = 0; i <= surahsNames.length; i++)
              return Container(
                height: 70,
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
      ));



    /* child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: ()async{
              print ("work");
              Api api= new Api();
              var suras= await api.getData();

              print("*********************************************");
              print("suras${suras}");
              for(var item in suras){
                print(item.name);

              }
            },
            child: Container(
              child: Text('quranGestur'),
            ),
          ),*/




  }
}
