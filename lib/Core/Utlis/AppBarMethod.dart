import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'dart:async';

AppBar homeAppBar(BuildContext context, {required String title}) {
  ValueNotifier<DateTime> now = ValueNotifier(DateTime.now());

  Timer.periodic(const Duration(seconds: 30), (timer) {
    now.value = DateTime.now();
  });

  return AppBar(
    backgroundColor: pKcolor,
    centerTitle: true,
    title: Text(title,
        style: AppStyles.styleBold32(context).copyWith(color: Colors.white)),
    actions: [
      ValueListenableBuilder<DateTime>(
        valueListenable: now,
        builder: (BuildContext context, DateTime value, Widget? child) {
          String formattedDate =
              DateFormat('h:mm a - EEEE - yyyy/M/d ', 'ar').format(value);
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Text(
                  formattedDate,
                  style: AppStyles.styleMedium18(context)
                      .copyWith(color: Colors.white),
                ),
                const Gap(8),
                const Icon(Icons.date_range_rounded, color: pKcolor)
              ],
            ),
          );
        },
      ),
      const Gap(16),
    ],
  );
}
