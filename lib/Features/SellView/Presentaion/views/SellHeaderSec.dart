import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/CustomerDropDownMenu.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellTotalSec.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SellHeaderSec extends StatelessWidget {
  const SellHeaderSec({super.key});

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
                Row(
                  children: [
                    const Gap(12),
                    const Expanded(flex: 5, child: CustomerDropDownMenu()),
                    Expanded(
                      child: Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Gap(16),
          SellTotalSec(),
          const Gap(16),
          Expanded(
            child: Column(
              children: [
                CustomTextField(
                  hintText: S.of(context).Notes,
                  maxLines: 4,
                ),
                const Gap(16),
                CustomTextField(
                  hintText: S.of(context).Sale,
                  isEGP: true,
                ),
              ],
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
