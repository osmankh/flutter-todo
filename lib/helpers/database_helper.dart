import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:todo_list/models/Task.dart';
import 'package:todo_list/models/Todo.dart';

class DatabaseHelper {

  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) async {
        await db.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)");
        await db.execute("CREATE TABLE todo(id INTEGER PRIMARY KEY, label TEXT, checked INTEGER, task_id INTEGER)");

        return db;
      },
      version: 1
    );
  }

  Future<int> insertTask(Task task) async {
    Database _db = await database();
    return await _db.insert('tasks', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> insertTodo(Todo todo) async {
    Database _db = await database();
    return await _db.insert('todo', todo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateTodo(Todo todo) async {
    // Get a reference to the database.
    final db = await database();

    // Update the given Dog.
    await db.update(
      'todo',
      todo.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [todo.id],
    );
  }

  Future<List<Task>> getTasks() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskMap = await _db.query("tasks");
    return List.generate(taskMap.length, (index) {
      return Task(id: taskMap[index]['id'], title: taskMap[index]['title'], description: taskMap[index]['description']);
    });
  }

  Future<List<Todo>> getTodos(task) async {
    int taskID = task != null ? task.id : 0;
    Database _db = await database();
    List<Map<String, dynamic>> todoMap = await _db.rawQuery("SELECT * FROM todo WHERE task_id = $taskID");
    return List.generate(todoMap.length, (index) {
      return Todo(id: todoMap[index]['id'], label: todoMap[index]['label'], checked: todoMap[index]['checked']);
    });
  }
}