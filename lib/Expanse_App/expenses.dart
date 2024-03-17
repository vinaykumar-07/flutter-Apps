//
import 'package:brand_assignment/Expanse_App/Expanse_lists/expanses_lists.dart';
import 'package:brand_assignment/Expanse_App/Models/expanse.dart';
import 'package:brand_assignment/Expanse_App/widgets/chart/chart.dart';
import 'package:brand_assignment/Expanse_App/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _Expanses();
}

class _Expanses extends State<Expenses> {
  final List<Expense> _registredExpense = [
    Expense(
      title: "Flutter Course",
      amount: 1999.89,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
        title: 'Cinema',
        amount: 599.50,
        date: DateTime.now(),
        category: Category.leisure)
  ];
  void addExpenses(Expense expense) {
    setState(() {
      _registredExpense.add(expense);
    });
  }

  void _onremovedExpense(Expense expense) {
    final expenseIndex = _registredExpense.indexOf(expense);
    setState(() {
      _registredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense Removed"),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registredExpense.insert(expenseIndex, expense);
            });
            print(expenseIndex);                                              
          }),
    ));
  }

  void _openAddExpenceOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => NewExpense(onAddExpense: addExpenses),
    );
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(
      child: Text("No Expense Found. Start adding..."),
    );

    if (_registredExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registredExpense,
        onRemovedExpense: _onremovedExpense,
      );
    }
    return Scaffold(
        appBar: AppBar(title: const Text("Expence Tracker"), actions: [
          IconButton(
              onPressed: _openAddExpenceOverlay, icon: const Icon(Icons.add))
        ]),
        body: Column(
          children: [
            Chart(expenses: _registredExpense),
            Expanded(child: mainContent)
          ],
        ));
  }
}
