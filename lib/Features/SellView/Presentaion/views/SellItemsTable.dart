import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellItemRowSec.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SellItemsTable extends StatelessWidget {
  const SellItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    // final box = Hive.box<ImportItemsModel>(testItems);
    return SizedBox();
    // ValueListenableBuilder(
    //   valueListenable: box.listenable(),
    //   builder: (context, value, child) {
    //     return Column(
    //       children: [
    //         ...List.generate(
    //             box.length,
    //             (index) => SellItemRowSec(
    //                   onDelete: () {
    //                     box.deleteAt(index);
    //                   },
    //                 )),
    //         SellItemRowSec()
    //       ],
    //     );
    //   },
    // );
  }
}
