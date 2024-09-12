class LoginModel {
  String? token;
  String? userId;
  List<dynamic>? roles;

  LoginModel({this.token, this.userId, this.roles});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json['token'] as String?,
        userId: json['userId'] as String?,
        roles: json['roles'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'userId': userId,
        'roles': roles,
      };
}
