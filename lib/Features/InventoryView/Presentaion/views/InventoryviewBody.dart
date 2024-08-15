import 'package:el7kma/Features/InventoryView/Presentaion/views/InventoryHeaderSec.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/views/InventoryTable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InventoryviewBody extends StatelessWidget {
  const InventoryviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [InventoryHeaderSec(), Gap(16), InventoryTable()],
          ),
        ),
      ),
    );
  }
}
