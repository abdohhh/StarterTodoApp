import 'package:flutter/material.dart';

class Tasklistscreen extends StatefulWidget {
  const Tasklistscreen({super.key});

  @override
  State<Tasklistscreen> createState() => _TasklistscreenState();
}

class _TasklistscreenState extends State<Tasklistscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Hallo, User!'),
            Text('Here are your 5 tasks for today'),
          ],
        ),
      ),
      body: Center(
        child: Text('This is the Task List Screen'),
      ),
    );
  }
}