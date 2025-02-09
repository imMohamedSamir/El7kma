class AddEmployeeModel {
  String? userName;
  String? email;
  String? password;
  String? name;
  String? phoneNumber;
  DateTime? dateOfBirth;
  double? salary;
  int? shiftHours;

  AddEmployeeModel({
    this.userName,
    this.email,
    this.phoneNumber,
    this.password,
    this.name,
    this.dateOfBirth,
    this.salary,
    this.shiftHours,
  });

  factory AddEmployeeModel.fromJson(Map<String, dynamic> json) {
    return AddEmployeeModel(
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      name: json['name'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      salary: json['salary'] as double?,
      shiftHours: json['shiftHours'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
        'name': name,
        'dateOfBirth': dateOfBirth?.toIso8601String(),
        'salary': salary,
        'shiftHours': shiftHours,
      };
}
