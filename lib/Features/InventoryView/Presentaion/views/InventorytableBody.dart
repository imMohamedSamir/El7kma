import 'package:el7kma/Features/InventoryView/Presentaion/views/InventoryItemCard.dart';
import 'package:flutter/material.dart';

class InventorytableBody extends StatelessWidget {
  const InventorytableBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [InventoryItemCard()],
    );
  }
}
