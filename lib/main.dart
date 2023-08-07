import 'package:flutter/material.dart';
import 'package:notes_apps/models/notes_operation.dart';
import 'package:notes_apps/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotesOperation>(
      create: (context) {
        return NotesOperation();
      },
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
