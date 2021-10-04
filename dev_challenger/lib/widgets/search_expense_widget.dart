import 'package:dev_challenge/widgets/save_button.dart';
import 'package:flutter/material.dart';


class SearchExpenseWidget extends StatelessWidget {
  final TextEditingController searchNameExpenseController;
  final VoidCallback onTap;
  const SearchExpenseWidget({
    Key? key,
    required this.searchNameExpenseController,
    required this.onTap,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pesquisar Gasto', style: TextStyle(fontSize: 25, color: Colors.black),),
            SizedBox(height: 20,),
            const Text('Qual gasto você procura?'),
            SizedBox(height: 5,),
            TextField(
              controller: searchNameExpenseController,
              style: TextStyle(color: Colors.black,),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 35,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                SaveButton(onPressed: onTap),
              ],
            ),
          
          ],
        ),
      ),
    );
  }
}