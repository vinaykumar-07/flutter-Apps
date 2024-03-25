import 'package:flutter/material.dart';
import 'package:brand_assignment/Todo_App/todo_model.dart';
import 'package:brand_assignment/Todo_App/database_helper.dart'; // Import the TodoDatabase class

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<Todo> _todos = [];
  final TodoDatabase _todoDatabase =
      TodoDatabase(); // Initialize TodoDatabase instance

  @override
  void initState() {
    super.initState();
    _initializeTodoList();
  }

  Future<void> _initializeTodoList() async {
    await _todoDatabase.initializeDatabase(); // Initialize the database
    final todos = await _todoDatabase.getTodos();
    setState(() {
      _todos.addAll(todos);
    });
  }

  void _addTodo(Todo todo) async {
    await _todoDatabase.insertTodo(todo); // Add todo to the database
    setState(() {
      _todos.add(todo);
    });
  }

  void _removeTodo(int index) async {
    await _todoDatabase
        .deleteTodo(_todos[index].id!); // Remove todo from the database
    setState(() {
      _todos.removeAt(index);
    });
  }

  void _toggleTodo(int index) async {
    final updatedTodo =
        _todos[index].copyWith(completed: !_todos[index].completed);
    await _todoDatabase.updateTodo(updatedTodo); // Update todo in the database
    setState(() {
      _todos[index] = updatedTodo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          Color priorityColor;
          switch (_todos[index].priority) {
            case 'high':
              priorityColor = Colors.red;
              break;
            case 'medium':
              priorityColor = Colors.orange;
              break;
            case 'low':
            default:
              priorityColor = Colors.green;
              break;
          }

          return Dismissible(
            key: Key(index.toString()), // Unique key for each item
            onDismissed: (direction) {
              _removeTodo(index);
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Card(
              color: _todos[index].completed ? null : priorityColor,
              child: ListTile(
                title: Text(
                  _todos[index].title,
                  style: TextStyle(
                    color: _todos[index].completed ? Colors.grey : Colors.black,
                    decoration: _todos[index].completed
                        ? TextDecoration.lineThrough
                        : null, // Add line-through if completed
                  ),
                ),
                subtitle: Text(
                  _todos[index].description,
                  style: TextStyle(
                    color: _todos[index].completed ? Colors.grey : Colors.black,
                  ),
                ),
                trailing: Checkbox(
                  value: _todos[index].completed,
                  onChanged: (bool? value) {
                    _toggleTodo(index);
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open a dialog to add a new todo
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newTitle = '';
              String newDescription = '';
              String priority = 'low'; // Default priority

              return AlertDialog(
                title: const Text('Add Todo'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      autofocus: true,
                      onChanged: (value) {
                        newTitle = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        newDescription = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      value: priority,
                      items: ['high', 'medium', 'low'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          priority = value!;
                        });
                      },
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      final newTodo = Todo(
                        title: newTitle,
                        description: newDescription,
                        priority: priority,
                      );
                      _addTodo(newTodo);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
