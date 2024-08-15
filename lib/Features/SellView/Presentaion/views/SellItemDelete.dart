import 'package:flutter/material.dart';

class SellItemDelete extends StatelessWidget {
  const SellItemDelete({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Colors.redAccent),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(right: 16),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }
}
