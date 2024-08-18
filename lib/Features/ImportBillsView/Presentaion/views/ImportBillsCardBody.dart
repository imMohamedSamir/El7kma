import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportBillsCardTable.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportItemsHeader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ImportBillsCardBody extends StatelessWidget {
  const ImportBillsCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ImportItemsHeader(), Gap(16), ImportBillsCardTable(), Gap(16)],
    );
  }
}
