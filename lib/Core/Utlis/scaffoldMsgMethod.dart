import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:flutter/material.dart';

abstract class ScaffoldMsgMethod {
  static void showMsg(BuildContext context,
      {required String msg, bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: isError ? Colors.red : Colors.green,
        content: Text(
          msg,
          style: AppStyles.styleMedium18(context).copyWith(color: Colors.white),
        )));
  }
}
