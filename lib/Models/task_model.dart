class TaskModel {
  int? id;
  late String Tasktitle;
  late String Description;
  late bool? isCompleted;
  late DateTime TaskAlarm;
  late String? priority;

  TaskModel({
    required this.Tasktitle,
    required this.Description,
    this.id,
    this.isCompleted,
    this.priority,
    required this.TaskAlarm,
  });

  TaskModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    Tasktitle = map['Tasktitle'];
    Description = map['Description'];
    isCompleted = map['isCompleted'] == 1;
    priority = map['priority'];
    TaskAlarm = DateTime.parse(map['TaskAlarm']);

  }
   Map<String, dynamic> toMap(TaskModel task) {
    return {
      'id': task.id,
      'Tasktitle': task.Tasktitle,
      'Description': task.Description,
      'isCompleted': task.isCompleted == true ? 1 : 0,
      'priority': task.priority,
      'TaskAlarm': task.TaskAlarm.toIso8601String(),
    };
  }
}

