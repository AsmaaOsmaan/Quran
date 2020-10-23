import 'package:flutter/material.dart';
import 'package:untitled3/view/surahIndex.dart';

import '../constants.dart';
//import 'package:holy_quran/constants.dart';

class HomePage extends StatefulWidget {
  static const id = "HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        backgroundColor: kMainColor,
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: new Text(
                  "Company",
                  style: TextStyle(fontSize: 25),
                ),
                trailing: new Icon(Icons.cancel),
                onTap: () => Navigator.pop(context),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                title: new Text(
                  "+919876543210",
                  style: TextStyle(fontSize: 19),
                ),
                leading: new Icon(Icons.phone),
                onTap: () => Navigator.pop(context),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Divider(
                  height: 10,
                  color: Colors.white,
                ),
              ),
              new ListTile(
                  title: new Text("My Wallet"),
                  leading: new Icon(Icons.account_balance_wallet),
                  onTap: () {
                    Navigator.of(context).pop();
                    //Navigator.pushNamed(context, MyWallet.id);
                  }),
              new ListTile(
                  title: new Text("My Orders"),
                  leading: new Icon(Icons.business),
                  onTap: () {
                    Navigator.of(context).pop();
                    //Navigator.pushNamed(context, MyOrders.id);
                  }),
              new ListTile(
                  title: new Text("Offers"),
                  leading: new Icon(Icons.attach_money),
                  onTap: () {
                    Navigator.of(context).pop();
                    //Navigator.pushNamed(context, Offers.id);
                  }),
              new ListTile(
                  title: new Text("About Us"),
                  leading: new Icon(Icons.contact_mail),
                  onTap: () {
                    Navigator.of(context).pop();
                    //Navigator.pushNamed(context, AboutUs.id);
                  }),
              ListTile(
                title: new Text("Rate Us"),
                leading: new Icon(Icons.star),
                onTap: null,
              ),
              ListTile(
                title: new Text("Share"),
                leading: new Icon(Icons.share),
                onTap: null,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Divider(
                  height: 10,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                color: Colors.orange,
                width: MediaQuery.of(context).size.width * .3,
                height: MediaQuery.of(context).size.height * .07,
                child: FlatButton(
                  onPressed: () {},
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SurahIndex.id);
                    },
                    child: Text(
                      'الفهرس',
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                color: Colors.orange,
                width: MediaQuery.of(context).size.width * .3,
                height: MediaQuery.of(context).size.height * .07,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'اللغه',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                color: Colors.orange,
                width: MediaQuery.of(context).size.width * .3,
                height: MediaQuery.of(context).size.height * .07,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'المزيد',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
