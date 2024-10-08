import 'package:el7kma/Features/DashboardView/Presentaion/views/DashboardHeaderSec.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [DashboardHeaderSec(), Gap(16)],
          ),
        ),
      ),
    );
  }
}
