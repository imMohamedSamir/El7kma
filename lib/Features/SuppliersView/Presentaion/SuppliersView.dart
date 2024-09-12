import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/views/SuppliersViewBody.dart';
import 'package:flutter/material.dart';

class SuppliersView extends StatelessWidget {
  const SuppliersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context, title: "الموردين"),
      body: const SuppliersViewBody(),
    );
  }
}
