import 'package:expanse_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expanse_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expanse_tracker/widgets/new_expense.dart';

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
        title: "Flutter course",
        amount: 27.9,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Cinema",
        amount: 52.3,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
        title: const Text(
          "Expense tracker",
        ),
      ),
      body: Column(
        children: [
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
          const Text("The expenses"),
        ],
      ),
    );
  }
}
