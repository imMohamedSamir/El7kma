import 'package:el7kma/Features/DamagedAndReturnView/Presentaion/views/DorRitemHeader.dart';
import 'package:el7kma/Features/DamagedAndReturnView/Presentaion/views/DorRitemTable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DorRitemSec extends StatelessWidget {
  const DorRitemSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: const Color(0xffEFF1F2),
            borderRadius: BorderRadius.circular(16)),
        child: const Column(
          children: [
            DorRitemHeader(),
            DorRitemTable(),
            Gap(16),
          ],
        ),
      ),
    );
  }
}
