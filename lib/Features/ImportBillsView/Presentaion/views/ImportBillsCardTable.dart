import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportBillsItemCard.dart';
import 'package:el7kma/Features/ImportBillsView/data/models/ImportItemModel.dart';
import 'package:flutter/material.dart';

class ImportBillsCardTable extends StatelessWidget {
  const ImportBillsCardTable({super.key, required this.items});
  final List<ImportItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            items.length, (index) => ImportBillsItemCard(item: items[index]))
      ],
    );
  }
}
