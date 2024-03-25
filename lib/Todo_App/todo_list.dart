
import 'package:brand_assignment/Todo_App/todo_model.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> _todos = [];

  void _addTodo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTitle = '';
        String newDescription = '';
        String priority = 'low'; // Default priority

        return AlertDialog(
          title: Text('Add Todo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                autofocus: true,
                onChanged: (value) {
                  newTitle = value;
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newDescription = value;
                },
                decoration: InputDecoration(
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
                setState(() {
                  if (newTitle.isNotEmpty && newDescription.isNotEmpty) {
                    _todos.add(Todo(
                      title: newTitle,
                      description: newDescription,
                      priority: priority,
                    ));
                  }
                  Navigator.of(context).pop();
                });
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _removeTodo(int index) {
    setState(() {
      final removedTodo = _todos.removeAt(index);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${removedTodo.title} removed"),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _todos.insert(index, removedTodo);
              });
            },
          ),
        ),
      );
    });
  }

  void _toggleTodo(int index) {
    setState(() {
      _todos[index].completed = !_todos[index].completed;
    });
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Todo List'),
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
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
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
                  decoration: _todos[index].completed ? TextDecoration.lineThrough : null, // Add line-through if completed
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
      onPressed: _addTodo,
      tooltip: 'Add Todo',
      child: Icon(Icons.add),
    ),
  );
}

  }
