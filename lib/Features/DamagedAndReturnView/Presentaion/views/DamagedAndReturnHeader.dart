import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/DamagedAndReturnView/Presentaion/views/DorRdropDown.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DamagedAndReturnHeader extends StatelessWidget {
  const DamagedAndReturnHeader({super.key});

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
                  label: S.of(context).BillNo,
                  enabled: false,
                  initialValue: "150",
                ),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).Total,
                  enabled: false,
                  initialValue: "150 ",
                  isEGP: true,
                ),
              ],
            ),
          ),
          const Gap(16),
          const Expanded(child: DorRdropDown()),
          const Gap(16),
          Expanded(
            child: CustomTextField(
              label: S.of(context).Notes,
              maxLines: 4,
              onChanged: (value) {
                if (value.trim().isNotEmpty) {
                } else {}
              },
            ),
          ),
          const Spacer(),
          Expanded(
            child: Column(
              children: [
                CustomButton(
                  txtcolor: Colors.white,
                  btncolor: pKcolor,
                  text: S.of(context).add,
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
