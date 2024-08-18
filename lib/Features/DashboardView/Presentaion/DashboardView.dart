import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Features/DashboardView/Presentaion/views/DashboardViewBody.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context, title: "الادارة"),
      body: const DashboardViewBody(),
    );
  }
}
