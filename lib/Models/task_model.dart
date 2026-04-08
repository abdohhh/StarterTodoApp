class Databasemodael {

  final int? id;
  final String Tasktitle;
  final String Description;
  final int TaskPriority;
  //  final DateTime TaskAlarm;
  // bool isCompleted;/

  Databasemodael({
    required this.Tasktitle,
    required this.Description,
    required this.TaskPriority, this.id,
    // required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
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
    id: 1,
    Tasktitle: "Task 1",
    Description: "Description for Task 1",
    TaskPriority: 1,
    // isCompleted: false,
  ),
  Databasemodael(
    id: 2,
    Tasktitle: "Task 2",
    Description: "Description for Task 2",
    TaskPriority: 2,
    // isCompleted: true,
  ),
  Databasemodael(
    id: 3,
    Tasktitle: "Task 3",
    Description: "Description for Task 3",
    TaskPriority: 3,
    // isCompleted: false,
  ),
  Databasemodael(
    id: 4,
    Tasktitle: "Task 4",
    Description: "Description for Task 4",
    TaskPriority: 4,
    // isCompleted: true,
  ),
];