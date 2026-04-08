import 'package:flutter/material.dart';

class Taskdetailsscreen extends StatefulWidget {
  const Taskdetailsscreen({super.key});

  @override
  State<Taskdetailsscreen> createState() => _TaskdetailsscreenState();
}

class _TaskdetailsscreenState extends State<Taskdetailsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Center(
        child: Text('This is the Task Details Screen'),
      ),
    );
  }
}