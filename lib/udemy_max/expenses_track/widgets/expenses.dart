import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/expenses_track/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_mobile/udemy_max/expenses_track/models/expense.dart';
import 'package:flutter_mobile/udemy_max/expenses_track/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Apple',
        amount: 5.00,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Limbo',
        amount: 9.99,
        date: DateTime.now(),
        category: Category.game),
  ];

  void _openAddExpenseOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return const NewExpense();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: () => _openAddExpenseOverlay(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
