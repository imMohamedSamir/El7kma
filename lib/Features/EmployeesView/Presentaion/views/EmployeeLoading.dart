import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EmployeeLoadingBuilder extends StatelessWidget {
  const EmployeeLoadingBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            3,
            (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: AppSizes.getHeight(100, context),
                      width: AppSizes.getWidth(1200, context),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      margin: const EdgeInsets.only(bottom: 16),
                    ),
                  ),
                )),
      ],
    );
  }
}
