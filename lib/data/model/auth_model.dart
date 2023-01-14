class AuthModel {
  AuthModel({
    this.admin,
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.createdAt,
    this.updatedAt,
    this.displayName,
    this.token,
    this.refreshToken,
  });
  String? id;
  String? email;
  bool? admin;
  String? firstName;
  String? lastName;
  String? createdAt;
  String? updatedAt;
  String? displayName;
  String? token;
  String? refreshToken;

  AuthModel.fromJson(dynamic json) {
    id = json['_id'];
    email = json['email'];
    admin = json['admin'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    displayName = json['displayName'];
    token = json['token'];
    refreshToken = json['refreshToken'];
  }
}
