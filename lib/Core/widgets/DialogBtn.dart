import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:flutter/material.dart';

class DialogBtn extends StatelessWidget {
  const DialogBtn(
      {super.key,
      required this.text,
      this.onPressed,
      required this.txtColor,
      required this.btnColor});
  final String text;
  final void Function()? onPressed;
  final Color txtColor, btnColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: SizedBox(
        width: double.infinity,
        height: AppSizes.getHeight(46, context),
        child: ElevatedButton(
          style: ButtonStyle(
              shape: WidgetStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              backgroundColor: WidgetStateProperty.all<Color>(btnColor)),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppStyles.styleMedium16(context).copyWith(color: txtColor),
          ),
        ),
      ),
    );
  }
}
