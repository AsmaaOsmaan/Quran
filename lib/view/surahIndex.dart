import 'package:flutter/material.dart';
import 'package:untitled3/controller/apiController.dart';

class SurahIndex extends StatefulWidget {
  static const id = 'SurahIndex';
  @override
  _SurahIndexState createState() => _SurahIndexState();
}

class _SurahIndexState extends State<SurahIndex> {
  ApiController controlApi = ApiController();
  List surahsNames;

  fun() async {
    surahsNames = await controlApi.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Score : 0 points"),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 114,
        itemBuilder: (context, index) {
          //for (int i = 0; i <= surahsNames.length; i++)
          return ListTile(
            title: Text("${surahsNames}",
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
      ),
    );
  }
}
