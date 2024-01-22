import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/expenses_track/widgets/chart/chart.dart';
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
        category: CategoryExpenses.food),
    Expense(
        title: 'Limbo',
        amount: 9.99,
        date: DateTime.now(),
        category: CategoryExpenses.game),
  ];

  void _openAddExpenseOverlay(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(
          addExpense: _addExpense,
        );
      },
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final index = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense removed'),
        action: SnackBarAction(
            label: 'Undo',
            textColor: Colors.white,
            onPressed: () {
              setState(
                () {
                  _registeredExpenses.insert(index, expense);
                },
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expenses added yet!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, removeExpense: _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: () => _openAddExpenseOverlay(context),
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
        ],
      ),
      body: width < 600 ? Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ) : Row(
        children: [
          Expanded(
            child: Chart(expenses: _registeredExpenses),
          ),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
