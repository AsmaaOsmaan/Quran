import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/controller/services/api.dart';
import 'package:untitled3/models/arguments.dart';
import 'package:untitled3/models/surah.dart';

import 'Ayat_view.dart';
import 'surhas_view.dart';
import 'juza_view.dart';
import 'notes_view.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Api api = Api();
  final List<Widget> _tabItems = [SurhsView(), juzaView(), Notes()];
  int _activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Holy quran"),),
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
            ),
      Icon(
      Icons.note_add,
      size: 30,
    ),
          ],
          onTap: (index) {
            setState(() {
              _activePage = index;
            });
          },
        ),
        body:  _tabItems[_activePage],);
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
