import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatefulWidget {
  const EmployeeCard({super.key});

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  bool isEdit = false;
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomTextField(
          enabled: isEdit,
        )),
        Expanded(
            child: CustomTextField(
          enabled: isEdit,
        )),
        Expanded(
            child: CustomTextField(
          enabled: isEdit,
          maxLines: 1,
          initialValue: "555",
          secure: secure,
          suffixIcon: IconButton(
            icon: Icon(secure == true
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined),
            onPressed: () {
              secure = !secure;
              setState(() {});
            },
          ),
        )),
        Expanded(
            child: CustomTextField(
          isEGP: true,
          enabled: isEdit,
        )),
        if (!isEdit) editIcon(context) else saveIcon(context),
        deleteIcon(context)
      ],
    );
  }

  Widget editIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isEdit = true;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: pKcolor),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  Widget saveIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isEdit = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: pKcolor),
        child: const Icon(
          Icons.save,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  Widget deleteIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        Dialogmethods.deleteEmployee(context);
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.red),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
