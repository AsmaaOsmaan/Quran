import 'package:flutter/material.dart';
import 'package:untitled3/controller/services/api.dart';
import 'package:untitled3/models/arguments.dart';
import 'package:untitled3/models/surah.dart';

import 'Ayat_view.dart';

class SurhsView extends StatefulWidget {
  @override
  _SurhsViewState createState() => _SurhsViewState();
}

class _SurhsViewState extends State<SurhsView> {
  Api api = Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body:  FutureBuilder(
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
                          ss[index].ayahs,
                        ));
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
