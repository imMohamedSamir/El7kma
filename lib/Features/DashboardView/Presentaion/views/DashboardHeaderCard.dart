import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DashboardHeaderCard extends StatelessWidget {
  const DashboardHeaderCard(
      {super.key,
      required this.title,
      required this.body,
      this.isEgp = true,
      this.onTap});
  final String title, body;
  final bool isEgp;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                  colors: [Color(0xff1588B2), Color(0xff0677A0)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: AppStyles.styleSemiBold20(context)
                      .copyWith(color: Colors.white)),
              const Gap(16),
              Text("$body ${isEgp ? S.of(context).EGP : ""}",
                  style: AppStyles.styleMedium18(context)
                      .copyWith(color: Colors.white, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
