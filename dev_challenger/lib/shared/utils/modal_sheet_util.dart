import 'package:flutter/material.dart';

class ModalSheet {
  static Future elegantBottonSheet(
      {required BuildContext context,
      required Widget Function(BuildContext) builder}) async {
    return await showModalBottomSheet(
      isScrollControlled: true,
      
      context: context,
      builder: builder,
    );
  }
}
