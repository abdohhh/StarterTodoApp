import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Taskdetailsscreen extends StatefulWidget {
  const Taskdetailsscreen({super.key});

  @override
  State<Taskdetailsscreen> createState() => _TaskdetailsscreenState();
}

class _TaskdetailsscreenState extends State<Taskdetailsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Task Title',
                labelStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 24),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Task Description',
                labelStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 24),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
