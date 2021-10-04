import 'package:flutter/material.dart';

class Expense {
  double value;
  String name;
  DateTime date;
  String category;
  

  Expense({
    required this.value,
    required this.name,
    required this.category,
    required this.date,
    
  });
}
