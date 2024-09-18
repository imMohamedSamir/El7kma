import 'dart:developer';

import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/SellView/Presentaion/manager/cubit/export_invoice_cubit.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellItemRowSec.dart';
import 'package:el7kma/Features/SellView/data/models/export_invoice_model.dart';
import 'package:el7kma/Features/SellView/data/models/export_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SellItemsTable extends StatelessWidget {
  const SellItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<ExportInvoiceModel>(kExportInvoices);
    return KeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKeyEvent: (event) {
        if (event.logicalKey == LogicalKeyboardKey.f5) {
          BlocProvider.of<ExportInvoiceCubit>(context).clear();
        }
      },
      child: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) {
          return Column(
            children: [
              ...List.generate(getItems(box).length,
                  (index) => SellItemRowSec(itemModel: getItems(box)[index])),
              const SellItemRowSec()
            ],
          );
        },
      ),
    );
  }

  List<ExportItemModel> getItems(Box<ExportInvoiceModel> box) {
    if (box.isEmpty) {
      return [];
    } else {
      return box.values.first.items ?? [];
    }
  }
}
