import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class InventoryPackageSec extends StatefulWidget {
  const InventoryPackageSec(
      {super.key,
      this.isChecked = false,
      this.isEdit = false,
      this.isUser = false});
  final bool isChecked, isEdit, isUser;

  @override
  State<InventoryPackageSec> createState() => _InventoryPackageSecState();
}

class _InventoryPackageSecState extends State<InventoryPackageSec> {
  bool checked = false;
  @override
  void initState() {
    checked = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          Expanded(
              child: Checkbox(
            fillColor: widget.isUser && widget.isChecked
                ? WidgetStateProperty.all<Color>(pKcolor)
                : null,
            activeColor: pKcolor,
            value: checked,
            onChanged: widget.isUser || !widget.isEdit
                ? null
                : (value) {
                    setState(() {
                      checked = !checked;
                    });
                  },
          )),
          if (widget.isUser)
            const Expanded(
                child: CustomTextField(
              enabled: false,
              initialValue: "",
            ))
          else
            Expanded(
                child: CustomTextField(
              enabled: widget.isEdit,
              keyboardType: TextInputType.number,
            )),
        ],
      ),
    );
  }
}
