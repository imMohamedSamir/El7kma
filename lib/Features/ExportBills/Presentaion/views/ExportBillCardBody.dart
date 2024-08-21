import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportbillcardbodyHeader.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportbillcardbodyTable.dart';
import 'package:el7kma/Features/ExportBills/data/models/ExportBillModel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExportBillCardBody extends StatelessWidget {
  const ExportBillCardBody({super.key, required this.items});
  final List<ExprotItemModel> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExportbillcardbodyHeader(),
        Gap(16),
        ExportbillcardbodyTable(
          items: items,
        ),
        Gap(16),
      ],
    );
  }
}
