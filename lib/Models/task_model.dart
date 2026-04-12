class TaskModel {
  int? id;
  late String Tasktitle;
  late String Description;
  // late DateTime TaskAlarm;
  late bool? isCompleted;

  TaskModel({
    required this.Tasktitle,
    required this.Description,
    this.id,
    this.isCompleted,
    // required this.TaskAlarm,
  });

  TaskModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    Tasktitle = map['Tasktitle'];
    Description = map['Description'];
    isCompleted = map['isCompleted'] == 1;
  }
   Map<String, dynamic> toMap(TaskModel task) {
    return {
      'id': task.id,
      'Tasktitle': task.Tasktitle,
      'Description': task.Description,
      'isCompleted': task.isCompleted == true ? 1 : 0,
    };
  }
}

