import 'package:flutter/material.dart';
import 'package:todotasks/Screens/TaskDetailsScreen.dart';
import 'package:todotasks/Screens/TaskListScreen.dart';
import 'package:todotasks/core/Routes/app_routes.dart';
import 'package:todotasks/core/theme/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
