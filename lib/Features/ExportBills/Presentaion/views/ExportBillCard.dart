import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportBillCardBody.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportBillCardHeader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExportBillCard extends StatelessWidget {
  const ExportBillCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 8,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: const Color(0xffEFF1F2),
              borderRadius: BorderRadius.circular(16)),
          child: const Column(
            children: [ExportBillCardHeader(), Gap(16), ExportBillCardBody()],
          ),
        ),
      ),
    );
  }
}
