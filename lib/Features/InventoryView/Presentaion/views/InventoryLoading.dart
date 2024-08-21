import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class InventoryLoading extends StatelessWidget {
  const InventoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            5,
            (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Row(
                      children: [
                        Container(
                          height: AppSizes.getHeight(70, context),
                          width: AppSizes.getHeight(140, context),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.only(right: 8),
                        ),
                        const Gap(16),
                        Container(
                          height: AppSizes.getHeight(70, context),
                          width: AppSizes.getHeight(140, context),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.only(right: 8),
                        ),
                        const Gap(16),
                        Container(
                          height: AppSizes.getHeight(70, context),
                          width: AppSizes.getHeight(140, context),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.only(right: 8),
                        ),
                        const Gap(16),
                        Container(
                          height: AppSizes.getHeight(70, context),
                          width: AppSizes.getHeight(140, context),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.only(right: 8),
                        ),
                        const Gap(16),
                        Container(
                          height: AppSizes.getHeight(70, context),
                          width: AppSizes.getHeight(140, context),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.only(right: 8),
                        ),
                        const Gap(16),
                        Container(
                          height: AppSizes.getHeight(70, context),
                          width: AppSizes.getHeight(140, context),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.only(right: 8),
                        ),
                        const Gap(16),
                        Container(
                          height: AppSizes.getHeight(70, context),
                          width: AppSizes.getHeight(140, context),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.only(right: 8),
                        ),
                      ],
                    ),
                  ),
                )),
      ],
    );
  }
}
