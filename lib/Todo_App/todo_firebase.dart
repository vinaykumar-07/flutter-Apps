import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brand_assignment/Todo_App/todo_model.dart';

class TodoFirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'todos';

  Future<void> addTodo(Todo todo) async {
    try {
      await _firestore.collection(_collectionName).add(todo.toMap());
    } catch (e) {
      print('Error adding todo: $e');
      throw e;
    }
  }

  Future<void> updateTodo(Todo todo) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(todo.id! as String?)
          .update(todo.toMap());
    } catch (e) {
      print('Error updating todo: $e');
      throw e;
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      await _firestore.collection(_collectionName).doc(id).delete();
    } catch (e) {
      print('Error deleting todo: $e');
      throw e;
    }
  }

  Stream<List<Todo>> getTodos() {
    return _firestore.collection(_collectionName).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Todo(
          // id: doc.id!,
          title: doc['title'],
          description: doc['description'],
          priority: doc['priority'],
          completed: doc['completed'] ?? false,
        );
      }).toList();
    });
  }

  Future<void> updateTodoCompletion(String id, bool completed) async {
    try {
      await _firestore.collection(_collectionName).doc(id).update({
        'completed': completed,
      });
    } catch (e) {
      print('Error updating todo completion status: $e');
      throw e;
    }
  }
}
