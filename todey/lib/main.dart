import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todey/models/task_store.dart';
import 'package:todey/screens/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskStore(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
