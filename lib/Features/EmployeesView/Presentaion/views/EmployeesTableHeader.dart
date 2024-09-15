import 'package:el7kma/Features/SellView/Presentaion/views/SellHeaderCard.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmployeesTableHeader extends StatelessWidget {
  const EmployeesTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final List headers = [
      S.of(context).EmployeeName,
      S.of(context).PhoneNumber,
      S.of(context).ShiftHours,
      S.of(context).Salary,
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
        const Gap(100)
      ],
    );
  }
}
