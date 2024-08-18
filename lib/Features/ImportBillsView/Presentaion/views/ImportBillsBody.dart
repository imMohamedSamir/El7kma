import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportBillsHeader.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportBillsTable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ImportBillsBody extends StatelessWidget {
  const ImportBillsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ImportBillsHeader(), Gap(16), ImportBillsTable()],
          ),
        ),
      ),
    );
  }
}
