import 'package:dio/dio.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/models/user_model.dart';
import 'package:shopping_app/models/user_response.dart';
import 'package:shopping_app/models/product_model.dart';

class DioService {
  final _dio = Dio();

  Future<UserResponse?> loginUser(UserModel user) async {
    try {
      final result = await _dio.post(
        Constants.loginEndPoint,
        data: {"Email": user.email, "Password": user.password},
      );
      if (result.statusCode == 200) {
        return UserResponse.fromJson(result.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<UserResponse?> registerUser(UserModel user) async {
    try {
      final result = await _dio.post(
        Constants.registerEndPoint,
        data: {
          "Email": user.email,
          "Password": user.password,
          "Phone": user.phone,
          "Name": user.name,
        },
      );
      if (result.statusCode == 200) {
        return UserResponse.fromJson(result.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<ProductModel>?> getProducts() async {
    try {
      final result = await _dio.get(Constants.getProductsEndPoint);
      if (result.statusCode == 200) {
        return ProductResponse.fJ(result.data).pList;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
