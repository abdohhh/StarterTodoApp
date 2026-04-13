import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todotasks/core/DataBase/database_helper.dart';
import 'package:todotasks/models/task_model.dart';

class AddTasks extends StatefulWidget {
  const AddTasks({super.key});

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  @override
  TextEditingController TasktitleController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  int BottomcurrentIndex = 0;
  List Priority = ['Low', 'Medium', 'High'];
  String? selectedPriority = 'Low';
  DateTime selectedDate = DateTime.now();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                "Task Title",
                style: Theme.of(context).textTheme.displayLarge,
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
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Task Description",
                style: Theme.of(context).textTheme.displayLarge,
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
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),
              Text("priority", style: Theme.of(context).textTheme.displayLarge),
              SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          BottomcurrentIndex = index;
                          selectedPriority = Priority[index];
                          print(selectedPriority);
                        });
                      },

                      child: Container(
                        width: 100,
                        // height: 50,
                        margin: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: index == BottomcurrentIndex
                              ? Colors.blue
                              : Color(0xff1A1A1A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            Priority[index],
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Text("Alarm", style: Theme.of(context).textTheme.displayLarge),
              SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Color(0xFF22D3EE).withOpacity(0.2),
                      iconSize: 64,
                    ),
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      setState(() {
                        if (selectedDate != null) {
                          this.selectedDate = selectedDate;
                        }
                      });
                    },
                    icon: Icon(Icons.watch_later_outlined),
                  ),
                  SizedBox(width: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFF22D3EE).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TaskModel newtask = TaskModel(
            Tasktitle: TasktitleController.text,
            Description: DescriptionController.text,
            priority: selectedPriority,
            TaskAlarm: selectedDate,
          );
          TasksDataBase().insertTask(newtask);
          Navigator.pop(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
