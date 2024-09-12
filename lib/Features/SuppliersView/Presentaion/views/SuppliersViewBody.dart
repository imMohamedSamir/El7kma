import 'package:el7kma/Features/SuppliersView/Presentaion/views/SupplierHeaderSec.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/views/SupplierTable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SuppliersViewBody extends StatelessWidget {
  const SuppliersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Gap(16), SupplierHeaderSec(), Gap(16), SupplierTable()],
          ),
        ),
      ),
    );
  }
}
