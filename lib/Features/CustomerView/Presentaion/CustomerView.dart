import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/views/CustomerViewBody.dart';
import 'package:flutter/material.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context, title: "العملاء"),
      body: const CustomerViewBody(),
    );
  }
}
