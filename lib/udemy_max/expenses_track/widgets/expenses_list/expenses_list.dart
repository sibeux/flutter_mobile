import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/expenses_track/widgets/expenses_list/expenses_item.dart';

import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    Key? key,
    required this.expenses,
  }) : super(key: key);

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: ((context, index) => Dismissible(
            key: key,
            child: ExpensesItem(expense: expenses[index]),
          )),
    );
  }
}
