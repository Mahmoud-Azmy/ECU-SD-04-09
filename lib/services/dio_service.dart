import 'package:dio/dio.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/models/user_model.dart';
import 'package:shopping_app/models/user_response.dart';
import 'package:shopping_app/models/weather_model.dart';

class DioService {
  final _dio = Dio();

  Future<UserResponse?> loginUser(UserModel user) async {
    try {
      final result = await _dio.post(
        Consts.loginEndPoint,
        data: {"email": user.email, "password": user.password},
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
        Consts.registerEndPoint,
        data: {
          "email": user.email,
          "password": user.password,
          "phoneNumber": user.phone,
          "name": user.name,
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

  Future<List<WeatherModel>?> getWeather() async {
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
