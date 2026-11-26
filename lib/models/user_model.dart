class UserModel {
  final String? name;
  final String? phone;
  final String email;
  final String password;

  UserModel({
    this.name,
    this.phone,
    required this.email,
    required this.password,
  });
}
