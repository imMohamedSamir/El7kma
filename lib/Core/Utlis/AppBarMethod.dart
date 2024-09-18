import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomeDateWidget.dart';
import 'package:el7kma/Core/widgets/LogoutSec.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'dart:async';

AppBar homeAppBar(BuildContext context, {required String title}) {
  ValueNotifier<DateTime> now = ValueNotifier(DateTime.now());

  Timer.periodic(const Duration(seconds: 30), (timer) {
    now.value = DateTime.now();
  });

  return AppBar(
    backgroundColor: pKcolor,
    centerTitle: true,
    automaticallyImplyLeading: false,
    title: Text(title,
        style: AppStyles.styleBold32(context).copyWith(color: Colors.white)),
    actions: const [
      CustomeDateWidget(),
      Gap(16),
    ],
    leading: const LogoutSec(),
  );
}

AppBar othersAppBar(BuildContext context, {required String title}) {
  final ValueNotifier<int> tabIndex = ValueNotifier(0);

  return AppBar(
    backgroundColor: pKcolor,
    centerTitle: true,
    automaticallyImplyLeading: false,
    title: Text(
      title,
      style: AppStyles.styleBold32(context).copyWith(color: Colors.white),
    ),
    actions: const [
      CustomeDateWidget(),
      Gap(16),
    ],
    leading: const LogoutSec(),
    bottom: TabBar(
      labelColor: Colors.white,
      labelStyle: AppStyles.styleSemiBold20(context),
      unselectedLabelColor: Colors.grey,
      unselectedLabelStyle: AppStyles.styleSemiBold18(context),
      automaticIndicatorColorAdjustment: false,
      indicatorColor: scColor,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 5,
      mouseCursor: MouseCursor.uncontrolled,
      onTap: (value) {
        tabIndex.value = value;
      },
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: scColor,
      ),
      tabs: <Widget>[
        _buildTabItem(
          context,
          icon: Icons.attach_money_rounded,
          text: S.of(context).expneses,
          tabIndex: tabIndex,
          index: 0,
        ),
        _buildTabItem(
          context,
          icon: Icons.dangerous,
          text: S.of(context).DamagedAndReturn,
          tabIndex: tabIndex,
          index: 1,
        ),
      ],
    ),
  );
}

Widget _buildTabItem(
  BuildContext context, {
  required IconData icon,
  required String text,
  required ValueNotifier<int> tabIndex,
  required int index,
}) {
  return Tab(
    icon: ValueListenableBuilder(
      valueListenable: tabIndex,
      builder: (BuildContext context, int value, Widget? child) {
        return Icon(
          icon,
          color: value == index ? pKcolor : scColor,
        );
      },
    ),
    text: text,
  );
}
