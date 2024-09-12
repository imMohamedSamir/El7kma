import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OptionsLoding extends StatelessWidget {
  const OptionsLoding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          8,
          (index) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                    height: AppSizes.getHeight(52, context),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16)),
                        color: Colors.white.withOpacity(0.5))),
              )),
    );
  }
}
