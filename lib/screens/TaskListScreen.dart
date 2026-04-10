import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  // bool value = false;
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
              child: Image.asset(
                AppIcons.home,
                width: 35,
                height: 35,
                alignment: Alignment.center,
                fit: BoxFit.none,
              ),
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
              'Here are your ${testdata.length} tasks for today',
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
                itemCount: testdata.length,
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
                        Checkbox(
                          value: testdata[index].isCompleted,
                          onChanged: (bool? newValue) {
                            setState(() {
                              testdata[index].isCompleted = newValue ?? false;
                            });
                          },
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              testdata[index].Tasktitle,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              testdata[index].Description,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              testdata[index].TaskAlarm != null
                                  ? DateFormat.yMMMEd().format(
                                      testdata[index].TaskAlarm!,
                                    )
                                  : 'No Alarm',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        SizedBox(width: 16),
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
        onPressed: () {
          Navigator.pushNamed(context, Approutes.TaskDetailsScreen);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: BottomcurrentIndex,
        onTap: (index) {
          setState(() {
            BottomcurrentIndex = index;
          });
        },
        selectedItemColor: Color(0xFF22D3EE),
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
            activeIcon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            activeIcon: Icon(Icons.person),
          ),
        ],
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
