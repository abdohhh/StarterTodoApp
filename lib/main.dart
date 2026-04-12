import 'package:flutter/material.dart';
import 'package:todotasks/Models/task_model.dart';
import 'package:todotasks/Screens/TaskDetailsScreen.dart';
import 'package:todotasks/Screens/TaskListScreen.dart';
import 'package:todotasks/core/DataBase/database_helper.dart';
import 'package:todotasks/core/Routes/app_routes.dart';
import 'package:todotasks/core/theme/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TasksDataBase().database;
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Start Todo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.dark,
      darkTheme: AppThemes.dark,
      themeMode: ThemeMode.dark,
      routes: {
        Approutes.home: (context) => const Tasklistscreen(),
        Approutes.TaskDetailsScreen: (context) => const Taskdetailsscreen(),
      },
      initialRoute: Approutes.home,
    );
  }
}
