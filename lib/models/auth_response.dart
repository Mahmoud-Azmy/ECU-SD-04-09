class AuthResponse {
  final String message;
  final bool status;

  AuthResponse({required this.message, required this.status});

  factory AuthResponse.fromJson(Map<String, dynamic> data) {
    return AuthResponse(message: data["message"], status: data["statusCode"]);
  }
}
