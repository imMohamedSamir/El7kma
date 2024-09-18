import 'package:el7kma/Features/DamagedAndReturnView/Presentaion/views/DamagedAndReturnHeader.dart';
import 'package:el7kma/Features/DamagedAndReturnView/Presentaion/views/DorRitemSec.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DamagedAndReturnView extends StatelessWidget {
  const DamagedAndReturnView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DamagedAndReturnHeader(),
              Gap(16),
              DorRitemSec(),
            ],
          ),
        ),
      ),
    );
  }
}
