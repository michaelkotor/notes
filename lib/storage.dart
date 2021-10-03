import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'note.dart';

class Storage {

   Future<List<Note>> getNotes() async {
    final prefs = await SharedPreferences.getInstance();
    List<Note> notes = [];
    prefs.getKeys().forEach((key) {
      String? content = prefs.getString(key);
      String title = key;
      Note note = Note(title: title, text: content!);
      notes.add(note);
    });

    return notes;
  }

  void remove(Note note) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(note.title);
  }

  void save(Note note) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(note.title, note.text);
  }
}