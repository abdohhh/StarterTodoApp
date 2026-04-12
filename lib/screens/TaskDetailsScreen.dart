import 'package:flutter/material.dart';
import 'package:todotasks/core/DataBase/database_helper.dart';
import 'package:todotasks/models/task_model.dart';

class Taskdetailsscreen extends StatefulWidget {
  const Taskdetailsscreen({super.key});

  @override
  State<Taskdetailsscreen> createState() => _TaskdetailsscreenState();
}

class _TaskdetailsscreenState extends State<Taskdetailsscreen> {
  @override
  TextEditingController TasktitleController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  int BottomcurrentIndex = 0;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xff1A1A1A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.task, size: 32, color: Colors.white),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: TasktitleController,
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xff1A1A1A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.description, size: 32, color: Colors.white),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: DescriptionController,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TaskModel newtask = TaskModel(
            Tasktitle: TasktitleController.text,
            Description: DescriptionController.text,
            // TaskAlarm: DateTime.now(),
          );
          TasksDataBase().insertTask(newtask);
          Navigator.pop(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
