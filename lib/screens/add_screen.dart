import 'package:flutter/material.dart';
import 'package:notes_apps/db/database_provider.dart';
import 'package:notes_apps/models/note.dart';
import 'package:notes_apps/models/operations/notes_operation.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noteNotifier = context.read<NotesOperation>();

    // var operation = Provider.of<NotesOperation>(context, listen: false);

    String titleText = "";
    String descriptionText = "";

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Task Manager'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: 80,
        ),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              onChanged: (value) {
                titleText = value;
              },
            ),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Description',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                onChanged: (value) {
                  descriptionText = value;
                },
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 10,
                  bottom: 10,
                ),
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                final note = Note(
                  title: titleText,
                  description: descriptionText,
                );

                noteNotifier.addNewNote(note);
                Navigator.pop(context);

                // await databaseProvider.insert(note).then((value) {
                //   Navigator.pop(context);
                // }).catchError((error) {
                //   print("KESALAHAN: $error");
                // });
                // operation.addNewNote(titleText, descriptionText);
              },
              child: const Text(
                'Add Note',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
