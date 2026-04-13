import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:todotasks/core/DataBase/database_helper.dart';
import 'package:todotasks/core/Routes/app_routes.dart';
import 'package:todotasks/core/assets/app_icons.dart';
import 'package:todotasks/models/task_model.dart';

class Tasklistscreen extends StatefulWidget {
  const Tasklistscreen({super.key});

  @override
  State<Tasklistscreen> createState() => _TasklistscreenState();
}

class _TasklistscreenState extends State<Tasklistscreen> {
  int activeindex = 0;
  List<String> filter = ['All Tasks', 'Work', 'Personal', 'Shopping', 'Others'];
  int BottomcurrentIndex = 0;
  List<TaskModel> tasks = [];
  TextEditingController TasktitleController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  final NotchBottomBarController _notchController = NotchBottomBarController(
    index: 0,
  );
  @override
  void initState() {
    super.initState();
    refresh();
  }

  loadData() async {
    var loadedTasks = await TasksDataBase().getTasks;
    tasks = loadedTasks.map((e) => TaskModel.fromMap(e)).toList();
  }

  refresh() async {
    await loadData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(width: 16),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(AppIcons.home),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hallo, User!',
              style: Theme.of(
                context,
              ).textTheme.displayLarge?.copyWith(fontSize: 18),
            ),
            Text(
              'Here are your ${tasks.length} tasks for today',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 12),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 16),
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Handle settings icon press
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('TODAY', style: Theme.of(context).textTheme.displayLarge),
            Text(
              DateFormat.yMMMEd().format(DateTime.now()),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: filter.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        activeindex = index;
                      });
                    },
                    child: FilterBar(index, context),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xff1A1A1A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        //* MSHCheckbox
                        MSHCheckbox(
                          checkedColor: Color(0xFF22D3EE),
                          size: 24,
                          style: MSHCheckboxStyle.fillScaleCheck,
                          value: tasks[index].isCompleted!,
                          onChanged: (bool? newValue) {
                            setState(() {
                              tasks[index].isCompleted = newValue ?? false;

                              TasksDataBase().updateTask(
                                tasks[index].id!,
                                tasks[index],
                              );
                            });
                          },
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tasks[index].Tasktitle,
                                style: tasks[index].isCompleted!
                                    ? Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.copyWith(
                                        fontSize: 24,
                                        decoration: TextDecoration.lineThrough,
                                      )
                                    : Theme.of(context).textTheme.bodyMedium!
                                          .copyWith(fontSize: 24),
                              ),
                              Text(
                                tasks[index].Description,
                                style: tasks[index].isCompleted!
                                    ? Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.copyWith(
                                        fontSize: 18,
                                        decoration: TextDecoration.lineThrough,
                                      )
                                    : Theme.of(context).textTheme.bodySmall!
                                          .copyWith(fontSize: 18),

                                overflow: TextOverflow.ellipsis,
                              ),

                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF22D3EE),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      tasks[index].priority ?? 'No Priority',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF22D3EE),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      DateFormat.yMMMEd().format(
                                        tasks[index].TaskAlarm,
                                      ),
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Spacer(),
                        IconButton(
                          onPressed: () async {
                            await TasksDataBase().deleteTask(tasks[index].id!);
                            refresh();
                          },
                          icon: Icon(Icons.delete_outline, color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, Approutes.AddTasks);
          refresh();
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        kIconSize: 24,
        kBottomRadius: 12,
        removeMargins: false,
        bottomBarWidth: 500,
        showShadow: false,
        durationInMilliSeconds: 300,
        shadowElevation: 5,
        elevation: 1,
        notchBottomBarController: _notchController,
        color: Color(0xff1A1A1A),
        showLabel: true,
        notchColor: Color(0xFF22D3EE),
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(Icons.home_outlined, color: Colors.white),
            activeItem: Icon(Icons.home_filled, color: Colors.white),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.calendar_today_outlined,
              color: Colors.white,
            ),
            activeItem: Icon(Icons.calendar_today, color: Colors.white),
            itemLabel: 'Calendar',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person_outline, color: Colors.white),
            activeItem: Icon(Icons.person, color: Colors.white),
            itemLabel: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            BottomcurrentIndex = index;
            _notchController.index = index;
          });
        },
      ),
    );
  }

  Container FilterBar(int index, BuildContext context) {
    return Container(
      // width: 200,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: index == activeindex ? Color(0x4A22D3EE) : Color(0xff1A1A1A),
        border: Border.all(
          color: index == activeindex ? Color(0xFF22D3EE) : Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          filter[index],
          style: index == activeindex
              ? Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Color(0xFF22D3EE))
              : Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
