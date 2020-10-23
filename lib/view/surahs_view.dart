import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/controller/services/api.dart';
import 'package:untitled3/models/arguments.dart';
import 'package:untitled3/models/surah.dart';

import 'Ayat_view.dart';

class surhView extends StatefulWidget {
  @override
  _surhViewState createState() => _surhViewState();
}

class _surhViewState extends State<surhView> {
  Api api = Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: Colors.orange.shade600,
          backgroundColor: Colors.white,
          color: Colors.blueAccent,
          items: <Widget>[
            Icon(
              Icons.list,
              size: 30,
            ),
            Icon(
              Icons.compare_arrows,
              size: 30,
            )
          ],
          onTap: (index) {
            //
          },
        ),
        body: FutureBuilder(
          future: api.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  List<Surah> ss = snapshot.data;
                  //for (int i = 0; i <= surahsNames.length; i++)
                  return ListTile(
                    title: Text("${ss[index].name}",
                        textAlign: TextAlign.end,
                        style: new TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      "${ss[index].englishName}",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 13.9,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic),
                    ),
                    trailing: new CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: new Text(
                        "${ss[index].number}",
                        style: TextStyle(fontSize: 19.9, color: Colors.yellow),
                      ),
                    ),
                    leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${ss[index].englishNameTranslation}",
                          style: TextStyle(
                              fontSize: 13.9,
                              color: Colors.blue,
                              fontStyle: FontStyle.italic),
                        ),
                        Text(
                          "${ss[index].revelationType}",
                          style: TextStyle(
                              fontSize: 13.9,
                              color: Colors.blueGrey,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AyatView.id,
                          arguments: ScreenArguments(
                              ss[index].number,
                              ss[index].englishName,
                              ss[index].name,
                              ss[index].ayahs));
                    },
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

/*
Container(
                height: 70,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AyatView.id,
                        arguments: ScreenArguments(
                            ss[index].number,
                            ss[index].englishName,
                            ss[index].name,
                            ss[index].ayahs));
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
                            new Text("${ss[index].englishName}",
                                style: new TextStyle(
                                    fontSize: 18, color: Colors.blue)),
                            SizedBox(
                              height: 5,
                            ),
                            new Text("${ss[index].englishNameTranslation}",
                                style: new TextStyle(
                                    fontSize: 13.9, color: Colors.blue)),
                          ],
                        ),
                        Text("${ss[index].revelationType}",
                            style: new TextStyle(
                                fontSize: 15, color: Colors.blueGrey)),
                        Text("${ss[index].name}",
                            style: new TextStyle(
                                fontSize: 18, color: Colors.teal)),
                      ],
                    ),
                  ),
                ),
              );
            */
