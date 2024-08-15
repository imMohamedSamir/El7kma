import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeUserNameSec extends StatelessWidget {
  const HomeUserNameSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mohamed",
            style:
                AppStyles.styleMedium16(context).copyWith(color: Colors.white),
          ),
          const Gap(2),
          Text(S.of(context).admin,
              style: AppStyles.styleRegular14(context)
                  .copyWith(color: Colors.grey))
        ],
      ),
    );
  }
}
