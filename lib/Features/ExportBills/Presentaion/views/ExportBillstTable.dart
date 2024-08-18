import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportBillCard.dart';
import 'package:flutter/material.dart';

class ExportBillstTable extends StatelessWidget {
  const ExportBillstTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...List.generate(2, (index) => const ExportBillCard())],
    );
  }
}
