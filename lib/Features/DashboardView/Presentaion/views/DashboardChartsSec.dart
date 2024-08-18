import 'package:el7kma/Features/DashboardView/Presentaion/views/DashboardSellsChart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DashboardChartsSec extends StatelessWidget {
  const DashboardChartsSec({super.key});

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
              DashboardSellsChart(),
              Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}
