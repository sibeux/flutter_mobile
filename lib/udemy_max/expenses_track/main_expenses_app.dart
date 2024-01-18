import 'package:flutter/material.dart';

import 'package:flutter_mobile/udemy_max/expenses_track/widgets/expenses.dart';

class MainExpensesApp extends StatelessWidget {
  const MainExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
          useMaterial3: true, scaffoldBackgroundColor: Colors.red[100]),
      home: const Expenses(),
    );
  }
}
