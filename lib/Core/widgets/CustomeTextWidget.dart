import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:flutter/material.dart';

class CustomeTextWidget extends StatelessWidget {
  const CustomeTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        text,
        textDirection: TextDirection.rtl,
        style: AppStyles.styleMedium18(context).copyWith(
          color: const Color(0xff240301),
        ),
      ),
    );
  }
}
