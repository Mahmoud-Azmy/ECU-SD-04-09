class UserResponse {
  final bool status;
  final String message;

  UserResponse({required this.status, required this.message});
  factory UserResponse.fromJson(Map<String, dynamic> data) {
    return UserResponse(status: data['statusCode'], message: data['message']);
  }
}