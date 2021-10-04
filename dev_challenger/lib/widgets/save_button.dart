import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SaveButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Salvar'),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF4ECDC4),
        onPrimary: Colors.black,
        minimumSize: Size(150, 50),
      ),
    );
  }
}
