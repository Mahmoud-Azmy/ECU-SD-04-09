import 'package:dio/dio.dart';
import 'package:shopping_app/consts.dart';
import 'package:shopping_app/models/auth_model.dart';
import 'package:shopping_app/models/product_model.dart';

class DioService {
  late Dio _dio;
  DioService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Consts.baseUrl,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
      ),
    );
  }

  Future<AuthResponse?> loginUser(AuthRequest user) async {
    try {
      final result = await _dio.post(
        Consts.loginEndPoint,
        data: {"Email": user.email, "Password": user.password},
      );
      if (result.statusCode == 200) {
        return AuthResponse.fromJson(result.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<AuthResponse?> registerUser(AuthRequest user) async {
    try {
      final result = await _dio.post(
        Consts.registerEndPoint,
        data: {
          "Email": user.email,
          "Password": user.password,
          "Phone": user.phone,
          "Name": user.name,
        },
      );
      if (result.statusCode == 200) {
        return AuthResponse.fromJson(result.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<ProductModel>?> getProducts() async {
    try {
      final result = await _dio.get(Consts.getProductsEndPoint);
      if (result.statusCode == 200) {
        final res = ProductResponse.fromJson(result.data);
        return res.response;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
