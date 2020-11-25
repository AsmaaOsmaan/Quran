import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/blocks/notic_block.dart';

import 'package:untitled3/controller/services/api.dart';


//import 'Ayat_view.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {

int numLoop;
  NoticBlock noteBlock= NoticBlock();
  TextEditingController _textEditingController=  TextEditingController();
List<Color> colors = [
  Colors.grey,
  Colors.blueGrey,
  Colors.brown

];
int index;
  @override
  void dispose(){
    noteBlock.dispose();
    super.dispose();
  }
  @override
initState(){
    get();
}
get ()async{
  SharedPreferences preferences=   await SharedPreferences.getInstance();
 // numLoop= preferences.getInt('num');
  index= preferences.getInt('num');
  if(preferences.getInt('num')==null){
    index=1;
  }
  else{
    index= preferences.getInt('num')+1;
  }
}
 int getcolor(){
  Random random=Random();
  int rand=random.nextInt(colors.length);
  return rand;
}

  List<int>  number=[];
  TextEditingController _notesController=TextEditingController();
  var _formKey=GlobalKey<FormState>();


 // List<String>juza=["الاول","الثانى ","لتالت","الرابع ","الخامس","السادس ","السابع","التامن ","التاسع ","العاشر ","الاحد عشر","الثانى عشر ","الثالث عشر ","الرابع عشر ","الخامس عشر","السادس عشر ","السابع عشر","الثامن عشر ","التاسع عشر","العشرون ","الواحد والعشرون","الثانى والعشرون","الثالث والعشرون","الرابع والعشرون","الخامس والعشرون","السادس والعشرون","السابع والعشرون","الثامن والعشرون","التاسع والعشرون","الثلاوثون"];
  Api api=Api();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  FutureBuilder(future:getNotes() ,builder: (context, snapshot) {
        if (snapshot.hasData) {
          return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              primary: false,
              padding: const EdgeInsets.all(10),


              itemCount: snapshot.data.length,

              itemBuilder: (context, index) {
                List<String>ss=snapshot.data;

             return   GestureDetector(

                  child: GestureDetector(
                    onTap: () {


                    },
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Hero(
                        tag: 'index${index}',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: colors[getcolor()],
                          ),

                          padding: const EdgeInsets.all(8),

                          child: Column(
                            children: <Widget>[

                              Padding(
                                padding: EdgeInsets.only(
                                  top: 40,
                                  left: 0,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      ss[index].toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),

                          //  color: Colors.pink,
                        ),
                      ),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index) =>
                  StaggeredTile.count(2, index.isEven ? 3 : 3),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            );








        } else {
          return Center(child: Text('Loading...'),);
        }
      } ,
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){





        showAlertDialog(context);









      },
        child: Icon(Icons.add),),
    );
  }



Future<List<String>> getNotes()async{
  print("oopen");
    List<String>newNotes;
   SharedPreferences preferences=   await SharedPreferences.getInstance();
   int num= preferences.getInt('num');
  newNotes=[];
 for (int i=1;i<=index-1;i++){

 //  preferences.setString('notes${i}', "ASmaa");
   String Notes=   preferences.getString('notes${i}');
       print(Notes);
       newNotes.add(Notes);

 }
print(newNotes);
   return newNotes;
 }


  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Add"),
      onPressed:  ()async {

    if(_formKey.currentState.validate()){

    String _notes= _notesController.text;
   // print("mansss${_notes}");
    //  String _password=_passController.text;
    SharedPreferences preferences= await SharedPreferences.getInstance();

    preferences.setString('notes${index}', _notes);

    preferences.setInt('num', index);




   // print("adedd${index}");
setState(() {
  index++;
});
    number.add(index);

    print(index);
    print(number);

    Navigator.pop(context);
    _notesController.text='';

    }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Add Notes"),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _notesController,
          //controller: _textEditingController,
          decoration: const InputDecoration(
            icon: Icon(Icons.note_add),
            hintText: 'write your notes',
            labelText: 'Notes *',
          ),

          validator: (String value) {
            //return value.contains('@') ? 'Do not use the @ char.' : null;
            if(value.isEmpty){
              return 'Notes is requierd';              }
            return null;

          },
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;  },
    );
  }


}


