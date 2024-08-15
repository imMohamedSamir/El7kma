import 'package:el7kma/Features/SellView/Presentaion/views/SellItemsHeader.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellItemsTable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SellItemsSec extends StatelessWidget {
  const SellItemsSec({super.key});

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
          children: [
            SellItemsHeader(),
            SellItemsTable(),
            Gap(16),
          ],
        ),
      ),
    );
  }
}
