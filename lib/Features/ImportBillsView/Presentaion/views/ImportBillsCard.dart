import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportBillsCardBody.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportBillsCardHeader.dart';
import 'package:flutter/material.dart';

class ImportBillsCard extends StatelessWidget {
  const ImportBillsCard({super.key});

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
            children: [ImportBillsCardHeader(), ImportBillsCardBody()],
          ),
        ),
      ),
    );
  }
}
