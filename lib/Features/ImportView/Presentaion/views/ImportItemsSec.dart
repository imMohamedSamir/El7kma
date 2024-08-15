import 'package:el7kma/Features/ImportView/Presentaion/views/ImportItemsHeader.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportItemsTable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ImportItemsSec extends StatelessWidget {
  const ImportItemsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: const Color(0xffEFF1F2),
            borderRadius: BorderRadius.circular(16)),
        child: const Column(
          children: [ImportItemsHeader(), ImportItemsTable(), Gap(16)],
        ),
      ),
    );
  }
}
