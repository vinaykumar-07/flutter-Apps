import 'package:brand_assignment/Todo_App/todo_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TodoDatabase {
  late Database _database;

  Future<void> initializeDatabase() async {
    // Get a location using getDatabasesPath
    String path = join(await getDatabasesPath(), 'todo_database.db');

    // Open the database. Can also add an onUpdate callback parameter.
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // Create the todo table
      await db.execute(
        "CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT, description TEXT, priority TEXT, completed INTEGER)",
      );
    });
  }

  Future<List<Todo>> getTodos() async {
    final List<Map<String, dynamic>> maps = await _database.query('todos');
    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        priority: maps[i]['priority'],
        completed: maps[i]['completed'] == 1,
      );
    });
  }

  Future<void> insertTodo(Todo todo) async {
    await _database.insert(
      'todos',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTodo(Todo todo) async {
    await _database.update(
      'todos',
      todo.toMap(),
      where: "id = ?",
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteTodo(int id) async {
    await _database.delete(
      'todos',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}