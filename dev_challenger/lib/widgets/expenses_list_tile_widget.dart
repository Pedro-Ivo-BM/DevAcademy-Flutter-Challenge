import 'package:dev_challenge/shared/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensesListTile extends StatelessWidget {
  final Expense expense;

  const ExpensesListTile({required this.expense, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            
            border: Border(right: BorderSide(width: 8, color: Color(0xFF292F36))),
            //borderRadius: BorderRadius.only(),
            //border: Border.all(width: 0.5),
          ),
          child: Row(
            children: [
              Icon(
                Icons.money,
                size: 40,
                color: Color(0xFF292F36),
              ),
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
        ),
        const Divider(
          height: 0.8,
          color: Colors.black,
        ),
      ],
    );
  }
}
