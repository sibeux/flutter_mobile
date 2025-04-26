import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/expenses_track/widgets/expenses_list/expenses_item.dart';

import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: ((context, index) => Dismissible(
            key: ValueKey(expenses[index].id),
            background: Container(
              color: Theme.of(context).colorScheme.error.withAlpha(180),
              margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              ),
            ),
            onDismissed: (direction) => removeExpense(
              expenses[index],
            ),
            child: ExpensesItem(
              expense: expenses[index],
            ),
          )),
    );
  }
}
