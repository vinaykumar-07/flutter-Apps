import 'package:brand_assignment/Expanse_App/Models/expanse.dart';
import 'package:flutter/material.dart';

class ExpanseItem extends StatelessWidget {
  const ExpanseItem(
    this.expanse, {
    super.key,
  });
  final Expense expanse;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(expanse.title),
            Row(
              children: [
                Text(expanse.amount.toStringAsFixed(2)),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expanse.category]),
                    //Text(expanse.category.name),
                    const SizedBox(width: 10),
                    Text(expanse.formatedDate)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
