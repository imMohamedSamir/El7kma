import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportBillsCardTable.dart';
import 'package:el7kma/Features/ImportBillsView/data/models/ImportItemModel.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportItemsHeader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ImportBillsCardBody extends StatelessWidget {
  const ImportBillsCardBody({super.key, required this.items});
  final List<ImportItemModel> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ImportItemsHeader(),
        const Gap(16),
        ImportBillsCardTable(items: items),
        const Gap(16)
      ],
    );
  }
}
