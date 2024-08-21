import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportbillcardItem.dart';
import 'package:el7kma/Features/ExportBills/data/models/ExportBillModel.dart';
import 'package:flutter/material.dart';

class ExportbillcardbodyTable extends StatelessWidget {
  const ExportbillcardbodyTable({super.key, required this.items});
  final List<ExprotItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            items.length,
            (index) => ExportbillcardItem(
                  item: items[index],
                ))
      ],
    );
  }
}
