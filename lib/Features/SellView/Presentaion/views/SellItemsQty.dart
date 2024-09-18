import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SellItemsQty extends StatefulWidget {
  const SellItemsQty({super.key, required this.controller, this.focusNode});
  final TextEditingController controller;
  final FocusNode? focusNode;
  @override
  State<SellItemsQty> createState() => _SellItemsQtyState();
}

class _SellItemsQtyState extends State<SellItemsQty> {
  int _quantity = 1;

  @override
  void initState() {
    super.initState();

    widget.controller.text = _quantity.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(6),
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
                  widget.controller.text = _quantity.toString();
                });
              },
            ),
            const Gap(16),
            SizedBox(
                width: AppSizes.getWidth(20, context),
                child: TextField(
                  focusNode: widget.focusNode,
                  style: AppStyles.styleSemiBold18(context)
                      .copyWith(color: pKcolor),
                  controller: widget.controller,
                  onChanged: (value) {
                    setState(() {
                      _quantity = int.tryParse(value) ?? 0;
                    });
                  },
                )),
            const Gap(16),
            QtyWidget(
              onTap: _quantity > 1
                  ? () {
                      setState(() {
                        _quantity--;
                        widget.controller.text = _quantity.toString();
                      });
                    }
                  : null,
              isLimit: _quantity == 1 || widget.controller.text.isEmpty,
            )
          ],
        ),
      ),
    );
  }
}

class QtyWidget extends StatelessWidget {
  const QtyWidget({
    super.key,
    this.onTap,
    this.isAdd = false,
    this.isLimit = false,
  });
  final void Function()? onTap;
  final bool isAdd, isLimit;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: AppSizes.getHeight(28, context),
          width: AppSizes.getWidth(28, context),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isLimit ? pKcolor.withOpacity(0.2) : pKcolor),
          child: Icon(isAdd ? Icons.add : Icons.remove,
              size: 18, color: Colors.white)),
    );
  }
}
