import 'package:el7kma/Features/SuppliersView/Presentaion/views/SupplierCard.dart';
import 'package:flutter/material.dart';

class SupplierTableBody extends StatelessWidget {
  const SupplierTableBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...List.generate(1, (index) => const SupplierCard())],
    );
  }
}
