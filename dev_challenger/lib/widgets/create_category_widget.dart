import 'package:dev_challenge/shared/models/category_model.dart';
import 'package:dev_challenge/view/home/home_controller.dart';
import 'package:dev_challenge/widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CreateCategoryWidget extends StatelessWidget {
  final TextEditingController nameCategoryController;
  final Function onSaved;

  const CreateCategoryWidget({
    Key? key,
    required this.nameCategoryController,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _homecontroller = Get.find();
    Rx<Category?> dropdownValue =
        _homecontroller.categoryTotal.toList().first.obs;
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nova Categoria',
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
              controller: nameCategoryController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Tipo'),
            SizedBox(
              height: 5,
            ),
            Obx(() {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 0.5,
                    //style: ButtonStyle.
                  ),
                ),
                child: DropdownButton(
                  value: dropdownValue.value,
                  onChanged: (value) {
                    dropdownValue.value = value as Category?;
                  },
                  items: _homecontroller.categoryTotal
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
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SaveButton(
                  onPressed: () {
                    Get.back();
                    _homecontroller.addCategory(
                        Category(names: nameCategoryController.text));
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
