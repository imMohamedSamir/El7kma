import 'package:el7kma/Features/SellView/Presentaion/views/SellHeaderSec.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellItemsSec.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SellviewBody extends StatelessWidget {
  const SellviewBody({super.key});

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
              SellHeaderSec(),
              Gap(16),
              SellItemsSec(),
            ],
          ),
        ),
      ),
    );
  }
}
