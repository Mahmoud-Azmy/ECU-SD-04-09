import 'package:flutter/material.dart';
import 'package:shopping_app/models/auth_request.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/services/dio_service.dart';

class AppProvider extends ChangeNotifier {
  final _dioService = DioService();
  bool isLoading = false;
  String? msg;
  List<ProductModel> pList = [];

  Future<bool> login(AuthRequest x) async {
    isLoading = true;
    msg = null;
    notifyListeners();
    final result = await _dioService.loginUser(x);
    isLoading = false;
    msg = result?.message;
    notifyListeners();
    return result?.status ?? false;
  }

  Future<bool> register(AuthRequest x) async {
    isLoading = true;
    msg = null;
    notifyListeners();
    final result = await _dioService.registerUser(x);
    isLoading = false;
    msg = result?.message;
    notifyListeners();
    return result?.status ?? false;
  }

  Future<void> get() async {
    isLoading = true;
    msg = null;
    notifyListeners();
    try {
      pList = await _dioService.getProducts() ?? [];
    } catch (e) {
      msg = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
