import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todotasks/core/assets/app_icons.dart';

class Tasklistscreen extends StatefulWidget {
  const Tasklistscreen({super.key});

  @override
  State<Tasklistscreen> createState() => _TasklistscreenState();
}

class _TasklistscreenState extends State<Tasklistscreen> {
  int activeindex = 0;
  List<String> filter = ['All Tasks', 'Work', 'Personal', 'Shopping', 'Others'];
  int BottomcurrentIndex = 0;
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
              'Here are your 5 tasks for today',
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
                    child: Container(
                      // width: 200,
                      margin: EdgeInsets.only(right: 16),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: index == activeindex
                            ? Color(0x4A22D3EE)
                            : Color(0xff1A1A1A),
                        border: Border.all(
                          color: index == activeindex
                              ? Color(0xFF22D3EE)
                              : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          filter[index],
                          style: index == activeindex
                              ? Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: Color(0xFF22D3EE))
                              : Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: Colors.white),
                        ),
                      ),
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
          // Handle add task button press
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
}
