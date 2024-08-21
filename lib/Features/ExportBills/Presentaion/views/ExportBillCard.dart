import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportBillCardBody.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportBillCardHeader.dart';
import 'package:el7kma/Features/ExportBills/data/models/ExportBillModel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExportBillCard extends StatelessWidget {
  const ExportBillCard({super.key, required this.bill});
  final ExportBillModel bill;
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
          child: Column(
            children: [
              ExportBillCardHeader(
                bill: bill,
              ),
              Gap(16),
              ExportBillCardBody(
                items: bill.items ?? [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
