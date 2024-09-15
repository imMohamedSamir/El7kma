import 'package:el7kma/Core/Utlis/scaffoldMsgMethod.dart';
import 'package:el7kma/Features/ImportView/Presentaion/manager/cubit/import_item_cubit.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportHeaderSec.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportItemsSec.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImportviewBody extends StatelessWidget {
  const ImportviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImportItemCubit, ImportItemState>(
      listener: (context, state) {
        if (state is ImportItemSuccess) {
          ScaffoldMsgMethod.showMsg(context,
              msg: S.of(context).SupplierInvoiceSuccess);
        } else if (state is ImportItemFailure) {
          ScaffoldMsgMethod.showMsg(context,
              isError: true, msg: S.of(context).ErrorMsg);
        }
      },
      child: const SizedBox(
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
      ),
    );
  }
}
