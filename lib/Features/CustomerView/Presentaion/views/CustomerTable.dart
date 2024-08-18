import 'package:el7kma/Features/CustomerView/Presentaion/views/CustomerTableBody.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/views/CustomerTableHeader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomerTable extends StatelessWidget {
  const CustomerTable({super.key});

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
            CustomerTableHeader(),
            Gap(16),
            CustomerTableBody(),
            Gap(16)
          ],
        ),
      ),
    );
  }
}
