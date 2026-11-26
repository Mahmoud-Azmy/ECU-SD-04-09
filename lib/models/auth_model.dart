class AuthModelRequest {
  final String? name;
  final String? phone;
  final String email;
  final String password;

  AuthModelRequest({
    this.name,
    this.phone,
    required this.email,
    required this.password,
  });
}

class AuthModelResponse {
  final String message;
  final bool status;

  AuthModelResponse({required this.message, required this.status});

  factory AuthModelResponse.fromJson(Map<String, dynamic> data) {
    return AuthModelResponse(message: data['message'], status: data['status']);
  }
}
