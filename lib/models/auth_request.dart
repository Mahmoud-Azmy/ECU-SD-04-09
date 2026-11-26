class AuthRequest {
  final String? name;
  final String? phone;
  final String email;
  final String password;

    AuthRequest({
    this.name,
    this.phone,
    required this.email,
    required this.password,
  });
}
