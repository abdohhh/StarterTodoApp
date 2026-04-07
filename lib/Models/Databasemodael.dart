class Databasemodael {
  final String Tasktitle;
  final String Description;
  final int TaskPriority;
  //  final DateTime TaskAlarm;
  bool isCompleted;

  Databasemodael({
    required this.Tasktitle,
    required this.Description,
    required this.TaskPriority,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'Tasktitle': Tasktitle,
      'Description': Description,
      'TaskPriority': TaskPriority,
      // 'TaskAlarm': TaskAlarm.toIso8601String(),
      // 'isCompleted': isCompleted ? 1 : 0,
    };
  }
}

List<Databasemodael> testdata = [
  Databasemodael(
    Tasktitle: "Task 1",
    Description: "Description for Task 1",
    TaskPriority: 1,
    isCompleted: false,
  ),
  Databasemodael(
    Tasktitle: "Task 2",
    Description: "Description for Task 2",
    TaskPriority: 2,
    isCompleted: true,
  ),
  Databasemodael(
    Tasktitle: "Task 1",
    Description: "Description for Task 1",
    TaskPriority: 1,
    isCompleted: false,
  ),
  Databasemodael(
    Tasktitle: "Task 2",
    Description: "Description for Task 2",
    TaskPriority: 2,
    isCompleted: true,
  ),
];