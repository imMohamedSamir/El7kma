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

  static String? employeePassword(BuildContext context,
      {required String value}) {
    if (value.isEmpty || value.trim().isEmpty) {
      return S.of(context).EmployeePasswordValdation;
    }

    return null;
  }

  static String? employeeSalary(BuildContext context, {required String value}) {
    if (value.isEmpty || value.trim().isEmpty) {
      return S.of(context).EmployeeSalaryValidation;
    }

    return null;
  }
}
