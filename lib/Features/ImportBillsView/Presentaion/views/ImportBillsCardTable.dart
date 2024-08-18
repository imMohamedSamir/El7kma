import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportBillsItemCard.dart';
import 'package:flutter/material.dart';

class ImportBillsCardTable extends StatelessWidget {
  const ImportBillsCardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...List.generate(2, (index) => const ImportBillsItemCard())],
    );
  }
}
