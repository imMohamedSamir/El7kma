import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportBillsCard.dart';
import 'package:flutter/material.dart';

class ImportBillsTable extends StatelessWidget {
  const ImportBillsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...List.generate(2, (index) => const ImportBillsCard())],
    );
  }
}
