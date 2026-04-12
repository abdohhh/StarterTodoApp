
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todotasks/models/task_model.dart';


class TasksDataBase {
  static Database? _database;
  // static final TasksDataBase instance = TasksDataBase._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), "Uptodo.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
create Table Uptodotasks(
id INTEGER PRIMARY KEY autoincrement,
Tasktitle TEXT NOT NULL,
Description TEXT NOT NULL,
isCompleted INTEGER NOT NULL DEFAULT 0 
)
''');
      },
    );
  }

  Future<void> insertTask(TaskModel task) async {
    final db = await database;
    await db.insert("Uptodotasks", task.toMap(task));
    print("Task inserted successfully");
  }

  Future<List<Map<String, dynamic>>> get getTasks async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Uptodotasks');
    return maps;
  }

  Future<void> updateTask(int taskId , TaskModel task ) async {
    final db = await database;
    await db.update(
      'Uptodotasks',
      task.toMap(task),
      where: 'id = ?',
      whereArgs: [taskId],
    );
  }

  Future<void> deleteTask(int taskId) async {
    final db = await database;
    await db.delete('Uptodotasks', where: 'id = ?', whereArgs: [taskId]);
      }



  Future<void> get deleteallTak async {
    final db = await database;
    await db.delete('Uptodotasks');
  }

  Future<void> initDb() async {}


}
