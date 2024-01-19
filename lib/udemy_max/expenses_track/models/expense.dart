import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum CategoryExpenses { food, travel, game, work }

const categoryIcons = {
  CategoryExpenses.food: Icons.fastfood,
  CategoryExpenses.travel: Icons.flight,
  CategoryExpenses.game: Icons.videogame_asset,
  CategoryExpenses.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final CategoryExpenses category;

  String get formattedDate => formatter.format(date);
}

class ExpensesBucket {
  const ExpensesBucket({
    required this.category,
    required this.expenses,
  });

  ExpensesBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final CategoryExpenses category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (var expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
