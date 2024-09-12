import 'package:el7kma/Core/Utlis/AppAssets.dart';
import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DrawerHeaderSec extends StatelessWidget {
  const DrawerHeaderSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text("مكتبة الحكمة",
                  style: AppStyles.styleBold18(context)
                      .copyWith(color: Colors.white)),
            ),
          ),
          const Gap(16),
          Expanded(
              child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Image.asset(
              Assets.imagesLogo,
              height: AppSizes.getHeight(65, context),
              width: AppSizes.getWidth(65, context),
              fit: BoxFit.contain,
            ),
          ))
        ],
      ),
    );
  }
}
