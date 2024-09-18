import 'package:el7kma/Features/SellView/Presentaion/views/SellHeaderCard.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';

class DorRitemHeader extends StatelessWidget {
  const DorRitemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final List headers = [
      S.of(context).Code,
      S.of(context).Product,
      S.of(context).UnitPrice,
      S.of(context).Qty,
      S.of(context).totalAmount,
    ];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
            headers.length,
            (index) => Expanded(
                  child: SellHeaderCard(
                    title: headers[index],
                  ),
                )),
      ],
    );
  }
}
