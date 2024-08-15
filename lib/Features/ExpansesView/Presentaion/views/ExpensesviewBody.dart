import 'package:el7kma/Features/ExpansesView/Presentaion/views/ExpansesItemSec.dart';
import 'package:el7kma/Features/ExpansesView/Presentaion/views/ExpensesHeaderSec.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExpensesviewBody extends StatelessWidget {
  const ExpensesviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpensesHeaderSec(),
              Gap(16),
              ExpansesItemSec(),
            ],
          ),
        ),
      ),
    );
  }
}
