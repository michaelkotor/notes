import 'package:flutter/material.dart';

import 'note.dart';

class CardNote extends StatelessWidget {

  final Note note;
  final VoidCallback delete;

  const CardNote({ required this.note, required this.delete });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                note.title,
                style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.blueAccent
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                note.text,
                style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey[20]
                ),
              ),
              const SizedBox(height: 6.0),
              TextButton.icon(
                  onPressed: delete,
                  icon: const Icon(Icons.delete),
                  label: const Text("Delete")
              )
            ],
          ),
        )
    );
  }
}
