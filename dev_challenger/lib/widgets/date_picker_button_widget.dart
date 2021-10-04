import 'package:dev_challenge/view/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerButtonWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerButtonWidget> {
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
             pickDate(context);
           }, 
    child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width - 24,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          // style: ElevatedButton.styleFrom(primary: Color(0xFF4ECDC4)),
          // onPressed: 
          child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.date_range,
                size: 30,
              )),
        ),
  );

  Future pickDate(BuildContext context) async {
    HomeController _homeController = Get.find();
    _homeController.dateTimeExpense = await showDatePicker(
          context: context,
          initialDate: _homeController.dateTimeExpense,
          firstDate: DateTime(DateTime.now().year - 30),
          lastDate: DateTime(DateTime.now().year + 30),
        ) ??
        _homeController.dateTimeExpense;
  }
}
