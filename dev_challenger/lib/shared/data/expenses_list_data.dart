import 'package:dev_challenge/shared/models/expense_model.dart';

class MockExpenseList {
  static List<Expense> expenseList = [
    Expense(
      value: 10000,
      name: 'Gastos com hospital',
      date: DateTime.utc(2021, 11, 31),
      category: 'Saúde',
    ),
    Expense(
      value: 50000,
      name: 'Gastos na Itália',
      date: DateTime.utc(2021, 10, 27),
      category: 'Viagem',
    ),
    Expense(
      value: 800,
      name: 'Mercantil do Mês',
      date: DateTime.utc(2021, 09, 02),
      category: 'Mercado',
    ),
  ];
}
