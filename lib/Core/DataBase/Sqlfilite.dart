import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todotasks/Models/Databasemodael.dart';

class TasksDataBase {
  static Database? _database;
  static final TasksDataBase instanse = TasksDataBase._();
  TasksDataBase._();
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
TaskPriority INTEGER 
)
''');
      },
    );
  }

  Future<void> insertTask(Databasemodael Task) async {
    final db = await database;
    await db.insert("Uptodotasks", Task.toMap());
  }

  Future<List<Databasemodael>> Tasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Uptodotasks');
    return List.generate(maps.length, (index) {
      return Databasemodael(
        Tasktitle: maps[index]["Tasktitle"] as String,
        Description: maps[index]["Description"] as String,
        TaskPriority: maps[index]["TaskPriority"] as int,
        isCompleted: maps[index]["isCompleted"] as bool,
      );
    });
  }

  Future<void> updateTask(Databasemodael Task) async {
    final db = await database;
    await db.update(
      'Uptodotasks',
      Task.toMap(),
      where: 'Tasktitle = ?',
      whereArgs: [Task.Tasktitle],
    );
  }

  Future<void> DeleteTask(Databasemodael Task) async {
    final db = await database;
    await db.delete(
      'Uptodotasks',
      where: 'Tasktitle = ?',
      whereArgs: [Task.Tasktitle],
    );
  }

  Future<void> initDb() async {}
}
