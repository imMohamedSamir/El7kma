import 'package:el7kma/Features/ImportView/Presentaion/views/ImportHeaderSec.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportItemsSec.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ImportviewBody extends StatelessWidget {
  const ImportviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ImportHeaderSec(), Gap(16), ImportItemsSec()],
          ),
        ),
      ),
    );
  }
}
