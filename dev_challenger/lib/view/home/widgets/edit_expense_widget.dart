import 'package:dev_challenge/shared/models/category_model.dart';
import 'package:dev_challenge/shared/models/expense_model.dart';
import 'package:dev_challenge/view/home/home_controller.dart';
import 'package:dev_challenge/widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/date_picker_button_widget.dart';

class EditExpenseWidget extends StatelessWidget {
  final HomeController controller;

  const EditExpenseWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Rx<Category?> dropdownValue = controller.categoryTotal.toList().first.obs;
    return SizedBox(
      height: 515,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Editar Gasto',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            const Text('Nome'),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: controller.expenseNameController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Categoria'),
            SizedBox(
              height: 5,
            ),
            Obx(() {
              return DropdownButton(
                value: dropdownValue.value,
                onChanged: (value) {
                  dropdownValue.value = value as Category?;
                },
                items: controller.categoryTotal
                    .toList()
                    .map<DropdownMenuItem<Category>>(
                  (Category value) {
                    return DropdownMenuItem(
                      child: Text(
                        value.names,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      value: value,
                    );
                  },
                ).toList(),
                isExpanded: true,
              );
            }),
            SizedBox(
              height: 20,
            ),
            const Text('Data'),
            SizedBox(
              height: 5,
            ),
            DatePickerButtonWidget(),
            SizedBox(
              height: 20,
            ),
            const Text('Valor'),
            SizedBox(
              height: 5,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: controller.expenseValueCreateController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SaveButton(
                  onPressed: () {
                    controller.changeExpense(
                      Expense(
                        name: controller.expenseNameController.text,
                        value: double.parse(
                            controller.expenseValueCreateController.text),
                        category: dropdownValue.value!.names,
                        date: controller.dateTimeExpense,
                      ),
                    );
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
