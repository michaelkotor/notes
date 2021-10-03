import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'note.dart';
import 'storage.dart';

class CreateNote extends StatelessWidget {

  final myTitleController = TextEditingController();
  final myContentController = TextEditingController();

  final Storage storage = Storage();

  CreateNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("New"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          TextField(
            controller: myTitleController,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
          ),
          TextFormField(
            controller: myContentController,
            minLines: 2,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: 'description',
              hintStyle: TextStyle(
                  color: Colors.grey
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          TextButton.icon(
              onPressed: () {saveNote(context);},
              icon: const Icon(Icons.save),
              label: const Text("Save")
          )
        ]
      ),
    );
  }

  void saveNote(BuildContext context) {
    String title = myTitleController.text;
    String content = myContentController.text;
    Note toSave = Note(title: title, text: content);
    storage.save(toSave);
    Navigator.pop(context);
  }
}