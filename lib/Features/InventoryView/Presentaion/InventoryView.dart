import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/views/InventoryviewBody.dart';
import 'package:flutter/material.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context, title: "المخزن"),
      body: const InventoryviewBody(),
    );
  }
}
