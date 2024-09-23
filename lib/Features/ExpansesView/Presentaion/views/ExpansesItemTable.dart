import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/ExpansesView/Presentaion/manager/cubit/expenses_cubit.dart';
import 'package:el7kma/Features/ExpansesView/Presentaion/views/ExpansesItemRowSec.dart';
import 'package:el7kma/Features/ExpansesView/data/models/expenses_invoice_model.dart';
import 'package:el7kma/Features/ExpansesView/data/models/expenses_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExpansesItemTable extends StatelessWidget {
  const ExpansesItemTable({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<ExpensesInvoiceModel>(kExpensesInvoce);
    return KeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKeyEvent: (event) {
        if (event.logicalKey == LogicalKeyboardKey.f5) {
          BlocProvider.of<ExpensesCubit>(context).clear();
        }
      },
      child: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) {
          return Column(
            children: [
              ...List.generate(
                  getItems(box).length,
                  (index) =>
                      ExpansesItemRowSec(expenses: getItems(box)[index])),
              const ExpansesItemRowSec()
            ],
          );
        },
      ),
    );
  }

  List<ExpensesItemModel> getItems(Box<ExpensesInvoiceModel> box) {
    if (box.isEmpty) {
      return [];
    } else {
      return box.values.first.items ?? [];
    }
  }
}
