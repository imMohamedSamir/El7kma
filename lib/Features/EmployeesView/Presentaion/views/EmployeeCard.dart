import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/EmployeesView/data/models/EmployeeModel.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatefulWidget {
  const EmployeeCard({super.key, required this.employeeModel});
  final EmployeeModel employeeModel;

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  bool isEdit = false;
  bool secure = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Expanded(
              child: CustomTextField(
            enabled: isEdit,
            initialValue: widget.employeeModel.employeeName,
          )),
          Expanded(
              child: CustomTextField(
            enabled: isEdit,
            initialValue: widget.employeeModel.employeePhone,
          )),
          Expanded(
              child: CustomTextField(
            enabled: isEdit,
            maxLines: 1,
            initialValue: widget.employeeModel.employeePassword,
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
            initialValue: widget.employeeModel.employeeSalary,
          )),
          if (!isEdit) editIcon(context) else saveIcon(context),
          deleteIcon(context)
        ],
      ),
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
