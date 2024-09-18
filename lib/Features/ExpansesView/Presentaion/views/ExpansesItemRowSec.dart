import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellItemsQty.dart';
import 'package:flutter/material.dart';

class ExpansesItemRowSec extends StatelessWidget {
  const ExpansesItemRowSec({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: CustomTextField()),
        Expanded(
            child: CustomTextField(
          isEGP: true,
        )),
        // SellItemsQty(),
        Expanded(
            child: CustomTextField(
          isEGP: true,
          enabled: false,
        )),
      ],
    );
  }
}
