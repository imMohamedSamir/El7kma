import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/manager/employee_cubit/employee_cubit.dart';
import 'package:el7kma/Features/EmployeesView/data/models/EmployeeModel.dart';
import 'package:el7kma/Features/EmployeesView/data/models/add_employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeCard extends StatefulWidget {
  const EmployeeCard({super.key, required this.employeeModel});
  final EmployeeModel employeeModel;

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  bool isEdit = false;
  bool secure = true;
  AddEmployeeModel employee = AddEmployeeModel();
  @override
  void initState() {
    initiatData();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void initiatData() {
    employee.name = widget.employeeModel.employeeName;
    employee.userName = widget.employeeModel.employeeName;
    employee.phoneNumber = widget.employeeModel.employeePhone;
    employee.password = widget.employeeModel.employeePassword;
    employee.salary = widget.employeeModel.employeeSalary;
    employee.shiftHours = widget.employeeModel.shiftHours;
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
            onChanged: (value) {
              employee.name = value.trim();
              employee.userName = value.trim();
            },
          )),
          Expanded(
              child: CustomTextField(
            enabled: isEdit,
            initialValue: widget.employeeModel.employeePhone,
            onChanged: (value) {
              employee.phoneNumber = value.trim();
            },
          )),
          Expanded(
              child: CustomTextField(
            enabled: isEdit,
            maxLines: 1,
            initialValue: widget.employeeModel.shiftHours.toString(),
            onChanged: (value) {
              employee.shiftHours = int.parse(value.trim());
            },
          )),
          Expanded(
              child: CustomTextField(
                  isEGP: true,
                  enabled: isEdit,
                  initialValue: widget.employeeModel.employeeSalary.toString(),
                  onChanged: (value) {
                    employee.salary = double.tryParse(value.trim());
                  })),
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
        BlocProvider.of<EmployeeCubit>(context)
            .edit(employee: employee, id: widget.employeeModel.id ?? "");
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
        Dialogmethods.deleteEmployee(context, widget.employeeModel.id ?? "");
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
