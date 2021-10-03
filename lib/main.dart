import 'package:flutter/material.dart';

import 'card_note.dart';
import 'note.dart';
import 'create_note.dart';
import 'storage.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home': (context) => const NoteList(),
    '/create': (context) => CreateNote(),
  },
));

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Notes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.create),
            color: Colors.white,
            onPressed: () {Navigator.pushNamed(context, "/create").then((value) { setState(() {});});},
          ),
        ],
      ),
      body: FutureBuilder(
          future: storage.getNotes(),
          builder: (context, AsyncSnapshot<List<Note>> snapshot)  {
            switch(snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Text("loading");
              case ConnectionState.done:
                return Column(
                  children: create(snapshot.data),
                ) ;
              default:
                return const Text('Contact admin :)');
            }
          }
      ),
    );
  }

  List<CardNote> create(List<Note>? notes) {
    return notes!.map((note) {
      return CardNote(
        note: note,
        delete: () {
          setState(() {
            storage.remove(note);
          });
        }
      );
    }).toList();
  }
}





