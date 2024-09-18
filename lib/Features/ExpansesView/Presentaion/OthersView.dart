import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Features/DamagedAndReturnView/Presentaion/DamagedAndReturnView.dart';
import 'package:el7kma/Features/ExpansesView/Presentaion/views/ExpensesviewBody.dart';
import 'package:flutter/material.dart';

class OthersView extends StatelessWidget {
  const OthersView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: othersAppBar(context, title: "عمليات اخرى"),
        body: const TabBarView(
            children: [ExpensesviewBody(), DamagedAndReturnView()]),
      ),
    );
  }
}
