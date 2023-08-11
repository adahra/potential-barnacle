import 'package:flutter/material.dart';
import 'package:notes_apps/db/database_provider.dart';
import 'package:notes_apps/models/note.dart';
import 'package:notes_apps/models/operations/notes_operation.dart';
import 'package:provider/provider.dart';

class NotesCard extends StatelessWidget {
  final Note note;

  const NotesCard(this.note, {super.key});

  @override
  Widget build(BuildContext context) {
    final noteNotifier = context.read<NotesOperation>();

    // var operation = Provider.of<NotesOperation>(context, listen: false);

    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  note.description!,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Delete Task'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: [
                          Text('Are you sure want to delete ${note.title}?'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Yes'),
                        onPressed: () {
                          // operation.deleteNote(index);
                          // await databaseProvider.delete(note.id!);
                          noteNotifier.deleteNote(note.id!);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
