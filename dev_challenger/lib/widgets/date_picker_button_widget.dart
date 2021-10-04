import 'package:dev_challenge/view/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerButtonWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerButtonWidget> {
  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(backgroundColor: Colors.green,),
        onPressed: () {
          pickDate(context);
        },
        child: Text('Data'),
      );

  Future pickDate(BuildContext context) async {
    HomeController _homeController = Get.find();
    _homeController.dateTimeExpense = await showDatePicker(
          context: context,
          initialDate:  _homeController.dateTimeExpense,
          firstDate: DateTime(DateTime.now().year - 30),
          lastDate: DateTime(DateTime.now().year + 30),
        ) ??
        _homeController.dateTimeExpense;
  }
}
