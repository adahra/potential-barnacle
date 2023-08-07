import 'package:flutter/cupertino.dart';
import 'package:notes_apps/models/note.dart';

class NotesOperation with ChangeNotifier {
  List<Note> notes = [];

  List<Note> get note {
    return notes;
  }

  NotesOperation() {
    addNewNote('First Note', 'First Note Description');
  }

  void addNewNote(String title, String description) {
    Note note = Note(title, description);
    notes.add(note);

    notifyListeners();
  }

  void deleteNote(int index) {
    notes.removeAt(index);

    notifyListeners();
  }
}
