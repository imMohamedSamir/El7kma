import 'package:el7kma/Features/SuppliersView/Presentaion/views/SupplierTableBody.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/views/SupplierTableHeader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SupplierTable extends StatelessWidget {
  const SupplierTable({super.key});

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
            SupplierTableHeader(),
            Gap(16),
            SupplierTableBody(),
            Gap(16)
          ],
        ),
      ),
    );
  }
}
