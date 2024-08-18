import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportbillsviewBody.dart';
import 'package:flutter/material.dart';

class ExportBillsView extends StatelessWidget {
  const ExportBillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context, title: "فواتير البيع"),
      body: const ExportbillsviewBody(),
    );
  }
}
