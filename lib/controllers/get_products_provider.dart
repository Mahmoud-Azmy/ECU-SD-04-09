import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/services/dio_service.dart';

class GetProductsProvider extends ChangeNotifier {
  final DioService _dioService = DioService();
  String? errMessage;
  bool isLoading = false;
  List<WeatherModel> productsList = [];

  Future<void> getProducts() async {
    isLoading = true;
    errMessage = null;
    notifyListeners();

    try {
      productsList = await _dioService.getProducts() ?? [];
    } catch (e) {
      errMessage = e.toString();
      productsList = [];
    }
    isLoading = false;
    notifyListeners();
  }
}
