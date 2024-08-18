import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportBillstTable.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportBillsHeader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExportbillsviewBody extends StatelessWidget {
  const ExportbillsviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ExportBillsHeader(), Gap(16), ExportBillstTable()],
          ),
        ),
      ),
    );
  }
}
