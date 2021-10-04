import 'package:dev_challenge/shared/data/category_list_data.dart';
import 'package:dev_challenge/shared/data/expenses_list_data.dart';
import 'package:dev_challenge/shared/models/category_model.dart';
import 'package:dev_challenge/shared/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final categoryNameController = TextEditingController();
  final expenseNameController = TextEditingController();
  final expenseSearchNameController = TextEditingController();
  final expenseValueCreateController = TextEditingController();
  final expenseTotalValue = <Expense>[];
  final categoryTotal = <Category>[].obs;
  int index = 0;

  Rx<Category?> categoryExpense = Rx<Category?>(null);
  DateTime dateTimeExpense = DateTime.now();

  final RxList<Expense> filteredExpenseList = <Expense>[].obs;

  @override
  void onInit() {
    super.onInit();
    expenseTotalValue.addAll(MockExpenseList.expenseList);
    categoryTotal.addAll(MockCategoryList.categoryList);

    filteredExpenseList.addAll(expenseTotalValue);
    categoryExpense = categoryTotal.toList().first.obs;
  }

  void filterExpenses(String value) {
    List<Expense> _localFilterList = [];

    for (Expense exp in expenseTotalValue) {
      if (exp.name.toLowerCase().contains(value.toLowerCase())) {
        _localFilterList.add(exp);
      }
    }
    filteredExpenseList.value = _localFilterList;
  }

  void createExpense(Expense item) {
    clearControllers();
    filteredExpenseList.clear();
    expenseTotalValue.add(item);
    filteredExpenseList.addAll(expenseTotalValue);
  }

  void clearControllers() {
    categoryNameController.clear();
    expenseNameController.clear();
    expenseValueCreateController.clear();
    dateTimeExpense = DateTime.now();
  }

  void editExpense(index) {
    index = index;
    clearControllers();
    dateTimeExpense = filteredExpenseList[index].date;
    categoryNameController.text = filteredExpenseList[index].category;
    expenseNameController.text = filteredExpenseList[index].name;
    expenseValueCreateController.text =
        filteredExpenseList[index].value.toString();
  }

  void removeExpense(index) {
    expenseTotalValue
        .removeAt(expenseTotalValue.indexOf(filteredExpenseList[index]));
    filteredExpenseList.removeAt(index);
  }

  void changeExpense(Expense item) {
    expenseTotalValue[expenseTotalValue.indexOf(filteredExpenseList[index])] =
        item;
    filteredExpenseList[index] = item;
  }

  void addCategory(Category category) {
    categoryTotal.add(category);
    categoryNameController.clear();
  }

  void filterCategory(Category category) {
    List<Expense> _localFilterList = [];

    for (Expense exp in expenseTotalValue) {
      if (exp.category.toLowerCase().contains(category.names.toLowerCase())) {
        _localFilterList.add(exp);
      }
    }
    filteredExpenseList.value = _localFilterList;
  }

  void filterMonth() {
    List<Expense> _localFilterList = [];

    for (Expense exp in expenseTotalValue) {
      if (exp.date.month
          .toString()
          .toLowerCase()
          .contains(dateTimeExpense.month.toString().toLowerCase())) {
        _localFilterList.add(exp);
      }
    }
    filteredExpenseList.value = _localFilterList;
  }
}
