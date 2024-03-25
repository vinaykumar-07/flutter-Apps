// import 'package:brand_assignment/Todo_App/todo_model.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class TodoDatabase {
//   late Database _database;

//   Future<void> initializeDatabase(String path) async {
//     _database = await openDatabase(
//       join(await getDatabasesPath(), path),
//       onCreate: (db, version) {
//         return db.execute(
//           "CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT, description TEXT, priority TEXT, completed INTEGER)",
//         );
//       },
//       version: 1,
//     );
//   }

//   Future<List<Todo>> getTodos() async {
//     final List<Map<String, dynamic>> maps = await _database.query('todos');
//     return List.generate(maps.length, (i) {
//       return Todo(
//         id: maps[i]['id'],
//         title: maps[i]['title'],
//         description: maps[i]['description'],
//         priority: maps[i]['priority'],
//         completed: maps[i]['completed'] == 1,
//       );
//     });
//   }

//   Future<void> insertTodo(Todo todo) async {
//     await _database.insert(
//       'todos',
//       todo.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<void> updateTodo(Todo todo) async {
//     await _database.update(
//       'todos',
//       todo.toMap(),
//       where: "id = ?",
//       whereArgs: [todo.id],
//     );
//   }

//   Future<void> deleteTodo(int id) async {
//     await _database.delete(
//       'todos',
//       where: "id = ?",
//       whereArgs: [id],
//     );
//   }

//   Future<void> close() async {
//     await _database.close();
//   }
// }
