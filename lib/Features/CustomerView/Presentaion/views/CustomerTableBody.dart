import 'package:el7kma/Features/CustomerView/Presentaion/views/CustomerCard.dart';
import 'package:flutter/material.dart';

class CustomerTableBody extends StatelessWidget {
  const CustomerTableBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [CustomerCard()],
    );
  }
}
