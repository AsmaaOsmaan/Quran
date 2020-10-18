
import 'package:flutter/material.dart';
import 'package:untitled3/controller/services/api.dart';
import 'package:untitled3/view/surahs_view.dart';

import 'juza_view.dart';
import 'notes_view.dart';
class Home extends StatefulWidget {
  static const id = "Home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    tabController =TabController(
      initialIndex: 0,
      length: 3,
      vsync:  this,
    );
    return Scaffold(
appBar: AppBar(
  title: Text("Quran"),
),
      body: Column(
      children: <Widget>[
        TabBar(
          controller:tabController ,

          tabs: [
            Tab(text:"Surah" ,),
            Tab(text:"juza" ,),
            Tab(text:"Notes" ,),
          ],

        ),
        Flexible(
          child: TabBarView(
            controller:tabController ,
            children: <Widget>[

              surhView(),
              juzaView(),
              Notes(),

            ],
          ),
        )
      ],
      ),
    );
  }
 /* Widget drawTapView(BuildContext context){

    return Flexible(child: Container(

      child: TabBarView(
        controller: _tabController,
        children: [
         ,

              ),)
          ),
         ,

        ],
      ),
    ),) ;



  }*/
}
