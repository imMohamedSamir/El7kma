import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/HomeView/Presentaion/views/DrawerHeaderSec.dart';
import 'package:el7kma/Features/HomeView/Presentaion/views/HomeDraweOptionsSec.dart';
import 'package:el7kma/Features/HomeView/Presentaion/views/HomeUserNameSec.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeDrawerSec extends StatelessWidget {
  const HomeDrawerSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: pKcolor,
      child: const Column(children: [
        DrawerHeaderSec(),
        HomeUserNameSec(),
        Gap(8),
        Divider(height: 16, indent: 24, endIndent: 24),
        HomeDraweOptionsSec()
      ]),
    ));
  }
}
