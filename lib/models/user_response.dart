class UserResponse {
  final String message;
  final bool status;

  UserResponse({required this.message, required this.status});

  factory UserResponse.fromJson(Map<String, dynamic> data) {
    return UserResponse(message: data["message"], status: data["statusCode"]);
  }
}
