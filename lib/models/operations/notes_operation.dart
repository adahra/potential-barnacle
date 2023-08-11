import 'package:flutter/cupertino.dart';
import 'package:notes_apps/db/database_provider.dart';
import 'package:notes_apps/models/note.dart';

class NotesOperation with ChangeNotifier {
  List<Note> notes = [];

  List<Note> get note {
    return notes;
  }

  void addNewNote(Note note) {
    notes.add(note);
    
    notifyListeners();
  }

  Future<void> loadNote(DatabaseProvider databaseProvider) async {
    final notes = await databaseProvider.getAllNotes();
    note.clear();
    note.addAll(notes);

    notifyListeners();
  }

  void deleteNote(int index) {
    notes.removeAt(index);

    notifyListeners();
  }
}
