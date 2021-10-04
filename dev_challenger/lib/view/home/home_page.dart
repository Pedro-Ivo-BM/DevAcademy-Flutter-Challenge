import 'package:dev_challenge/shared/utils/modal_sheet_util.dart';
import 'package:dev_challenge/view/home/home_controller.dart';
import 'package:dev_challenge/view/home/widgets/category_list_tile_widget.dart';
import 'package:dev_challenge/view/home/widgets/create_expense_widget.dart';
import 'package:dev_challenge/view/home/widgets/edit_expense_widget.dart';
import 'package:dev_challenge/widgets/create_category_widget.dart';
import 'package:dev_challenge/widgets/expenses_list_tile_widget.dart';
import 'package:dev_challenge/widgets/filter_expense_widget.dart';
import 'package:dev_challenge/widgets/search_expense_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF292F36),
        elevation: 0,
        title: const Text(
          'Despesas', style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Text(
                              'Categorias',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () async {
                                await ModalSheet.elegantBottonSheet(
                                  context: context,
                                  builder: (ctx) {
                                    return CreateCategoryWidget(
                                      nameCategoryController:
                                          controller.categoryNameController,
                                      onSaved: () {},
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.add,),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Obx(
                          () => ListView.builder(
                            //physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.categoryTotal.toList().length,
                            itemBuilder: (context, index) {
                              return CategoryListTile(
                                icon: const Icon(Icons.category, size: 40, color: Colors.white,),
                                title: Text(
                                  controller.categoryTotal
                                      .toList()[index]
                                      .names,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                width: 110,
                                height: 110,
                                onTap: () {},
                                backgroundColor: Colors.grey,
                              );
                              
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Row(
                            children: [
                              Text(
                                'Gastos',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.search),
                                onPressed: () async {
                                  await ModalSheet.elegantBottonSheet(
                                    context: context,
                                    builder: (ctx) {
                                      return SearchExpenseWidget(
                                        searchNameExpenseController: controller
                                            .expenseSearchNameController,
                                        onTap: () {
                                          controller.filterExpenses(controller
                                              .expenseSearchNameController
                                              .text);
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                              const SizedBox(width: 15),
                              IconButton(
                                icon: const Icon(Icons.tune),
                                onPressed: () async {
                                  await ModalSheet.elegantBottonSheet(
                                    context: context,
                                    builder: (ctx) {
                                      return FilterExpenseWidget();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: RawScrollbar(
                          child: Obx(
                            () => ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: controller.filteredExpenseList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Slidable(
                                      actionPane:
                                          const SlidableDrawerActionPane(),
                                      actionExtentRatio: 0.10,
                                      child: Container(
                                        color: Colors.white,
                                        child: ExpensesListTile(
                                            expense: controller
                                                .filteredExpenseList[index]),
                                      ),
                                      secondaryActions: <Widget>[
                                        IconSlideAction(
                                          color: Colors.white,
                                          icon: Icons.edit,
                                          onTap: () async {
                                            controller.editExpense(index);
                                            await ModalSheet.elegantBottonSheet(
                                              context: context,
                                              builder: (ctx) {
                                                return EditExpenseWidget(
                                                  controller: controller,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        IconSlideAction(
                                          color: Colors.white,
                                          icon: Icons.delete,
                                          onTap: () =>
                                              controller.removeExpense(index),
                                        ),
                                      ],
                                    ));
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4ECDC4),
        onPressed: () async {
          await ModalSheet.elegantBottonSheet(
            context: context,
            builder: (ctx) {
              return CreateExpenseWidget(
                controller: controller,
              );
            },
          );
        },
        child: const Icon(Icons.payments, color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(),
      // ),
    );
  }
}
