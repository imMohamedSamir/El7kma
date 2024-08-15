import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';

class EmpolyeesHeaderSec extends StatelessWidget {
  const EmpolyeesHeaderSec({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.getWidth(200, context),
      child: CustomButton(
        text: S.of(context).add,
        txtcolor: Colors.white,
        btncolor: pKcolor,
        onPressed: () {
          Dialogmethods.addEmployee(context);
        },
      ),
    );
  }
}
