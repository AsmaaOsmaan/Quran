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
              return ListTile(
                title: Text("${ss[index].name}",
                    style: new TextStyle(fontSize: 13.9, color: Colors.blue)),
                leading: new CircleAvatar(
                  backgroundColor: Colors.green,
                  child: new Text(
                    "0",
                    style: TextStyle(fontSize: 19.9, color: Colors.yellow),
                  ),
                ),
                onTap: () {},
              );
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
