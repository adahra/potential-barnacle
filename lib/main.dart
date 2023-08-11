import 'package:flutter/material.dart';
import 'package:notes_apps/db/database_provider.dart';
import 'package:notes_apps/models/operations/notes_operation.dart';
import 'package:notes_apps/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return NotesOperation();
          },
        ),
        Provider(
          create: (context) {
            return DatabaseProvider();
          },
        ),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
