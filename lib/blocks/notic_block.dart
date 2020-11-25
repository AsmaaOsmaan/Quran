import 'dart:async';

import 'package:untitled3/models/note.dart';

import 'package:untitled3/contracts/disposable.dart';
//import 'package:streamproduct/models/note.dart';
class NoticBlock implements Disopsable{
  List<Note>notes;


  final StreamController<List<Note>>_notesController=StreamController<List<Note>>();
  Stream<List<Note>> get notesStream=>_notesController.stream;
  StreamSink<List<Note>> get notesStreamSink=>_notesController.sink;


  final StreamController<Note>_noteController=StreamController<Note>();
  // Stream<Note> get noteStream=>_noteController.stream;
  StreamSink<Note> get noteStreamSink=>_noteController.sink;


  NoticBlock(){
    notes=[
      Note("note1"),
      Note("note2"),
      Note("note3"),
      Note("note4")
    ];
    _notesController.add(notes);
    _noteController.stream.listen(_addNote);

  }

  void _addNote(Note note){
    notes.add(note);
    notesStreamSink.add(notes);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _notesController.close();
    _noteController.close();

  }

}