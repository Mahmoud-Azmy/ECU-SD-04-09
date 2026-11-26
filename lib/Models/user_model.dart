class UserModel {
  final String email;
  final String password;
  final String? name;
  final String? phone;

  UserModel({
    required this.email,
    required this.password,
    this.name,
    this.phone,
  });
}
