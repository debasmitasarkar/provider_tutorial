import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_101/create_task_page.dart';
import 'package:provider_101/task_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskNotifier(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          unselectedWidgetColor: Colors.white,
        ),
        home: CreateTaskPage(),
      ),
    );
  }
}
