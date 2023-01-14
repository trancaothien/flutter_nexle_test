class SignUpRequest {
  SignUpRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
  String firstName;
  String lastName;
  String email;
  String password;

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }
}
