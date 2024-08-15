import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Features/ExpansesView/Presentaion/views/ExpensesviewBody.dart';
import 'package:flutter/material.dart';

class ExpenesesView extends StatelessWidget {
  const ExpenesesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context, title: "مصاريف"),
      body: const ExpensesviewBody(),
    );
  }
}
