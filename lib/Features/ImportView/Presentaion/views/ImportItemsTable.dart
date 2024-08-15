import 'package:el7kma/Features/ImportView/Presentaion/views/ImportItemRowSec.dart';
import 'package:flutter/material.dart';

class ImportItemsTable extends StatelessWidget {
  const ImportItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ImportItemRowSec(),
    ]);
  }
}
