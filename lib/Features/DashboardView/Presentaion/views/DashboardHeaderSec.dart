import 'package:el7kma/Features/DashboardView/Presentaion/views/DashboardHeaderCard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DashboardHeaderSec extends StatelessWidget {
  const DashboardHeaderSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          const DashboardHeaderCard(
            title: 'ارباح',
            body: '500 ',
          ),
          const Gap(16),
          DashboardHeaderCard(
            title: 'المصاريف',
            body: '150 ',
            onTap: () {},
          ),
          const Gap(16),
          const DashboardHeaderCard(
            title: 'المبيعات',
            body: '500 ',
            isEgp: false,
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
