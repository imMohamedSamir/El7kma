import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellItemsQty.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ImportItemQty extends StatefulWidget {
  const ImportItemQty({super.key});

  @override
  State<ImportItemQty> createState() => _ImportItemQtyState();
}

class _ImportItemQtyState extends State<ImportItemQty> {
  late TextEditingController controller;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
    controller.text = _quantity.toString();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.withOpacity(0.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QtyWidget(
              isAdd: true,
              onTap: () {
                setState(() {
                  _quantity++;
                  controller.text = _quantity.toString();
                });
              },
            ),
            const Gap(16),
            SizedBox(
                width: AppSizes.getWidth(20, context),
                child: TextField(
                  style: AppStyles.styleSemiBold18(context)
                      .copyWith(color: pKcolor),
                  controller: controller,
                  onChanged: (value) {
                    setState(() {
                      _quantity = int.parse(value);
                    });
                  },
                )),
            const Gap(16),
            QtyWidget(
              onTap: _quantity > 1
                  ? () {
                      setState(() {
                        _quantity--;
                        controller.text = _quantity.toString();
                      });
                    }
                  : null,
              isLimit: _quantity == 1 || controller.text.isEmpty,
            )
          ],
        ),
      ),
    );
  }
}
