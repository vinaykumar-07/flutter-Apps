import 'package:brand_assignment/Expanse_App/Expanse_lists/expanse_item.dart';
import 'package:brand_assignment/Expanse_App/Models/expanse.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemovedExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemovedExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.75),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            ),
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              onRemovedExpense(expenses[index]);
            },
            child: ExpanseItem(expenses[index]));

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(expanses[index].id),
        //     Text(expanses[index].title),
        //     Text(expanses[index].amount),
        //     Text(expanses[index].catagory.name)
        //   ],
        // );
      },
    );
  }
}
