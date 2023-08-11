import 'package:notes_apps/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  Future<Database> open() async {
    return openDatabase(
      join(
        await getDatabasesPath(),
        'note.db',
      ),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE note(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT)');
      },
      version: 1,
    );
  }

  Future<void> insert(Note note) async {
    final db = await open();
    var value = {
      'title': note.title,
      'description': note.description,
    };
    await db.insert(
      'note',
      value,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> delete(int id) async {
    final db = await open();
    await db.delete(
      'note',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Note>> getAllNotes() async {
    final db = await open();
    final List<Map<String, dynamic>> maps = await db.query('note');

    return List.generate(maps.length, (index) {
      return Note(
        id: maps[index]['id'],
        title: maps[index]['title'],
        description: maps[index]['description'],
      );
    });
  }
}
