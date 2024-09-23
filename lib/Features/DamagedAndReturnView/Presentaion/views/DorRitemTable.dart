import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/DamagedAndReturnView/Presentaion/manager/cubit/damaged_retrun_cubit.dart';
import 'package:el7kma/Features/DamagedAndReturnView/Presentaion/views/DamagedRetrunItemRow.dart';
import 'package:el7kma/Features/DamagedAndReturnView/data/models/damaged_retrun_model/damaged_return_item_model.dart';
import 'package:el7kma/Features/DamagedAndReturnView/data/models/damaged_retrun_model/damaged_return_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DorRitemTable extends StatelessWidget {
  const DorRitemTable({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<DamagedRetrunModel>(kdamagedRetrunInvoice);
    return KeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKeyEvent: (event) {
        if (event.logicalKey == LogicalKeyboardKey.f5) {
          BlocProvider.of<DamagedRetrunCubit>(context).clear();
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
                      DamagedRetrunItemRow(itemModel: getItems(box)[index])),
              const DamagedRetrunItemRow()
            ],
          );
        },
      ),
    );
  }

  List<DamagedReturnItemModel> getItems(Box<DamagedRetrunModel> box) {
    if (box.isEmpty) {
      return [];
    } else {
      return box.values.first.items ?? [];
    }
  }
}
