class EmployeeModel {
  String? id;
  String? employeeName;
  String? employeePhone;
  String? employeePassword;
  double? employeeSalary;
  int? shiftHours;

  EmployeeModel(
      {this.id,
      this.employeeName,
      this.employeePhone,
      this.employeePassword,
      this.employeeSalary,
      this.shiftHours});
  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'] as String?,
      employeeName: json['name'] as String?,
      employeePhone: json['phoneNumber'] as String?,
      employeeSalary: json['salary'] as double?,
      shiftHours: json['shiftHours'] as int?,
      employeePassword: json['password'] as String?,
    );
  }
}
