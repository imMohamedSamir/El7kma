import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportBillsBody.dart';
import 'package:flutter/material.dart';

class ImportBillsView extends StatelessWidget {
  const ImportBillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context, title: "فواتير الواردات"),
      body: const ImportBillsBody(),
    );
  }
}
