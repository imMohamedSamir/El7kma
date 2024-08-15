import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/SupplierDropDownMenu.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ImportHeaderSec extends StatelessWidget {
  const ImportHeaderSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                CustomTextField(
                    label: S.of(context).UserName,
                    enabled: false,
                    initialValue: "ahmed"),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).BillNo,
                  enabled: false,
                  initialValue: "150",
                ),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).Paid,
                  isEGP: true,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              children: [
                const SupplierDropDownMenu(),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).Total,
                  enabled: false,
                  initialValue: "150 ",
                  isEGP: true,
                ),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).Rest,
                  initialValue: "0.0",
                  enabled: false,
                  isEGP: true,
                ),
              ],
            ),
          ),
          const Gap(16),
          Expanded(
            child: CustomTextField(
              hintText: S.of(context).Notes,
              maxLines: 7,
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              children: [
                CustomButton(
                  txtcolor: Colors.white,
                  btncolor: pKcolor,
                  text: S.of(context).add,
                ),
                const Gap(16),
                CustomButton(
                  txtcolor: Colors.white,
                  btncolor: pKcolor,
                  text: S.of(context).Reset,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
