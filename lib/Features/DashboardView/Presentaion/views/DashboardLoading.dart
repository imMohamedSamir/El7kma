import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DashboardLoading extends StatelessWidget {
  const DashboardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: AppSizes.getHeight(120, context),
          width: AppSizes.getWidth(300, context),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          // margin: const EdgeInsets.only(bottom: 16),
        ),
      ),
    );
  }
}
