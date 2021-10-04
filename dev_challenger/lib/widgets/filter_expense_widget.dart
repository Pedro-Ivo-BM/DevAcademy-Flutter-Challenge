import 'package:dev_challenge/shared/models/category_model.dart';
import 'package:dev_challenge/view/home/home_controller.dart';
import 'package:dev_challenge/widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'date_picker_button_widget.dart';

class FilterExpenseWidget extends StatelessWidget {
  FilterExpenseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    Rx<Category?> dropdownValue = controller.categoryTotal.toList().first.obs;
    var selection = 0.obs;
    return Obx(
      () => Container(
        child: selection.value == 0
            ? SizedBox(
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Escolha um filtro:',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          selection.value = 1;
                        },
                        child: Text('Data'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF4ECDC4),
                          onPrimary: Colors.black,
                          minimumSize: Size(200, 100),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: ElevatedButton(
                          onPressed: () {
                            selection.value = 2;
                          },
                          child: Text('Categoria'),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF4ECDC4),
                            onPrimary: Colors.black,
                            minimumSize: Size(200, 100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : selection.value == 1
                ? SizedBox(
                    height: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Selecione o filtro',
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DatePickerButtonWidget(),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SaveButton(
                                onPressed: () {
                                  Get.back();
                                  controller.filterMonth();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(
                    height: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Selecione o filtro',
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Categoria'),
                          SizedBox(
                            height: 5,
                          ),
                          Obx(() {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: DropdownButton(
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
                              ),
                            );
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SaveButton(
                                onPressed: () {
                                  Get.back();
                                  controller
                                      .filterCategory(dropdownValue.value!);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
