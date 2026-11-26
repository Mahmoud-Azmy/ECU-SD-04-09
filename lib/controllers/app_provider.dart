import 'package:flutter/material.dart';
import 'package:shopping_app/models/user_model.dart';
import 'package:shopping_app/models/weather_model.dart';
import 'package:shopping_app/services/dio_service.dart';

class AppProvider extends ChangeNotifier {
  final DioService _dioService = DioService();

  bool isLoading = false;
  String? errMessage;
  List<WeatherModel> bList = [];

  Future<bool> login(UserModel user) async {
    isLoading = true;
    errMessage = null;
    notifyListeners();
    final result = await _dioService.loginUser(user);
    isLoading = false;
    errMessage = result?.message;
    notifyListeners();
    return result?.status ?? false;
  }

  Future<bool> register(UserModel user) async {
    isLoading = true;
    errMessage = null;
    notifyListeners();
    final result = await _dioService.registerUser(user);
    isLoading = false;
    errMessage = result?.message;
    notifyListeners();
    return result?.status ?? false;
  }

  Future<void> get() async {
    isLoading = true;
    errMessage = null;
    notifyListeners();

    try {
      bList = await _dioService.getWeather() ?? [];
    } catch (e) {
      errMessage = e.toString();
      bList = [];
    }
    isLoading = false;
    notifyListeners();
  }
}
