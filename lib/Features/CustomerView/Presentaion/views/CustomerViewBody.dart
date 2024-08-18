import 'package:el7kma/Features/CustomerView/Presentaion/views/CustomerHeaderSec.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/views/CustomerTable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomerViewBody extends StatelessWidget {
  const CustomerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [CustomerHeaderSec(), Gap(16), CustomerTable()],
          ),
        ),
      ),
    );
  }
}
