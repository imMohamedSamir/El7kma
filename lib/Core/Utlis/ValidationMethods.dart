import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';

abstract class Validationmethods {
  static String? phoneNumber(BuildContext context, {required String value}) {
    if (value.isEmpty || value.trim().isEmpty) {
      return S.of(context).PhoneNumberValidator;
    }
    if (value.length > 11 || value.length < 11) {
      return S.of(context).PhoneNumberCorrect;
    }
    return null;
  }

  static String? userName(BuildContext context, {required String value}) {
    if (value.isEmpty || value.trim().isEmpty) {
      return S.of(context).userNameValidator;
    }

    return null;
  }

  static String? passWord(BuildContext context, {required String value}) {
    if (value.isEmpty || value.trim().isEmpty) {
      return S.of(context).PasswordValdation;
    }

    return null;
  }

  static String? employeeName(BuildContext context, {required String value}) {
    if (value.isEmpty || value.trim().isEmpty) {
      return S.of(context).EmployeeNameValidation;
    }

    return null;
  }

  static String? customerName(BuildContext context, {required String value}) {
    if (value.isEmpty || value.trim().isEmpty) {
      return S.of(context).CustomerNameValidation;
    }

    return null;
  }

  static String? employeePassword(BuildContext context,
      {required String value}) {
    if (value.isEmpty || value.trim().isEmpty) {
      return S.of(context).EmployeePasswordValdation;
    }

    return null;
  }

  static String? employeeSalary(BuildContext context, {required String value}) {
    double salary = double.tryParse(value) ?? 0;
    if (value.isEmpty || value.trim().isEmpty) {
      return S.of(context).EmployeeSalaryValidation;
    }
    if (salary == 0) {
      return S.of(context).SalaryCorrect;
    }
    return null;
  }

  static String? billNo(BuildContext context, {required String value}) {
    if (value.isEmpty || value.trim().isEmpty) {
      return S.of(context).BillNoValidateMsg;
    }

    return null;
  }
}
