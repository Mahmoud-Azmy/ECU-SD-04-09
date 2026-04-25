import 'package:flutter/material.dart';
import 'package:shopping_app/models/auth_model.dart';
import 'package:shopping_app/services/dio_service.dart';

class AuthProvider extends ChangeNotifier {
  final DioService _dioService = DioService();
  bool isLoading = false;
  Future<bool> login(AuthRequest user) async {
    isLoading = true;
    notifyListeners();
    final result = await _dioService.loginUser(user);
    isLoading = false;
    notifyListeners();
    return result?.status ?? false;
  }

  Future<bool> register(AuthRequest user) async {
    isLoading = true;
    notifyListeners();
    final result = await _dioService.registerUser(user);
    isLoading = false;
    notifyListeners();
    return result?.status ?? false;
  }
}
