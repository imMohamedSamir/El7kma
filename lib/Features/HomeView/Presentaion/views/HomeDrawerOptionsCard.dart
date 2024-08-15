import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/HomeView/data/models/DrawerOptionsModel.dart';
import 'package:flutter/material.dart';

class HomeDrawerOptionsCard extends StatelessWidget {
  const HomeDrawerOptionsCard(
      {super.key,
      this.isActive = false,
      required this.optionsModel,
      this.onTap});
  final bool isActive;
  final DrawerOptionsModel optionsModel;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        height: AppSizes.getHeight(52, context),
        padding: EdgeInsets.symmetric(horizontal: isActive ? 22 : 18),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            color: isActive ? Colors.white : Colors.white.withOpacity(0.05)),
        child: Row(
          children: [
            Expanded(
              child: Image.asset(
                optionsModel.img,
                height: AppSizes.getHeight(24, context),
                width: AppSizes.getWidth(24, context),
                fit: BoxFit.fitHeight,
              ),
            ),
            const Spacer(),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                optionsModel.title,
                style: AppStyles.styleSemiBold16(context)
                    .copyWith(color: isActive ? pKcolor : Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
