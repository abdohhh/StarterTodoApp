class TaskModel {
  final int? id;
  final String Tasktitle;
  final String Description;
  final DateTime? TaskAlarm;
  bool? isCompleted;

  TaskModel({
    required this.Tasktitle,
    required this.Description,
    this.id,
    this.isCompleted, 
    required this.TaskAlarm,
  });

  Map<String, dynamic> toMap() {
    return {        
      'id': id,
      'Tasktitle': Tasktitle,
      'Description': Description,
      'TaskAlarm': TaskAlarm,
      // 'TaskPriority': TaskPriority,
      // 'isCompleted': isCompleted ? 1 : 0,
    };
  }
}

List<TaskModel> testdata = [
  TaskModel(
    id: 1,
    Tasktitle: "Task 1",
    Description: "Description for Task 1",
    TaskAlarm: DateTime.now(),
    isCompleted: false,
  ),
  TaskModel(
    id: 2,
    Tasktitle: "Task 2",
    Description: "Description for Task 2",
    TaskAlarm: DateTime.now(),
    isCompleted: true,
  ),
  TaskModel(
    id: 3,
    Tasktitle: "Task 3",
    Description: "Description for Task 3",
    TaskAlarm: DateTime.now(),
    isCompleted: false,
  ),
  TaskModel(
    id: 4,
    Tasktitle: "Task 4",
    Description: "Description for Task 4",
    TaskAlarm: DateTime.now(),
    isCompleted: true,
  ),
];
