import 'package:dev_challenge/shared/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensesListTile extends StatelessWidget {
  final Expense expense;

  const ExpensesListTile({required this.expense, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(Icons.money, size: 40, color: Colors.green[500],),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('${expense.name}'), Text(expense.category)],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${expense.value}'),
              Text(DateFormat.yMMMd().format(expense.date))
            ],
          ),
        ],
      ),
    );
  }
}
