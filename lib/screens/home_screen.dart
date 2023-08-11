import 'package:flutter/material.dart';
import 'package:notes_apps/db/database_provider.dart';
import 'package:notes_apps/models/operations/notes_operation.dart';
import 'package:notes_apps/screens/add_screen.dart';
import 'package:notes_apps/screens/views/notes_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noteNotifier = context.read<NotesOperation>();
    final databaseProvider = context.read<DatabaseProvider>();

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddScreen();
              },
            ),
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.blueGrey,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Task Manager',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      // body: Consumer<NotesOperation>(
      //   builder: (context, value, child) {
      //     return ListView.builder(
      //       itemCount: value.note.length,
      //       itemBuilder: (context, index) {
      //         return NotesCard(value.note[index], index);
      //       },
      //     );
      //   },
      // ),
      body: FutureBuilder<void>(
        future: noteNotifier.loadNote(databaseProvider),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final notes = noteNotifier.note;

          if (notes.isEmpty) {
            return const Center(
              child: Text(
                'No notes yet',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return NotesCard(note);
            },
          );
        },
      ),
    );
  }
}
