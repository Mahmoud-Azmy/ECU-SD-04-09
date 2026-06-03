class WeatherModel {
  final int id;
  final String name;
  final String tempreature;
  final String weatherImageUrl;
  final String countryImageUrl;
  final String weatherCondition;

  WeatherModel({
    required this.id,
    required this.name,
    required this.tempreature,
    required this.weatherImageUrl,
    required this.countryImageUrl,
    required this.weatherCondition,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    return WeatherModel(
      id: data['id'],
      tempreature: data['tempreature'],
      name: data['name'],
      weatherImageUrl: data['weatherImageUrl'],
      weatherCondition: data['weatherCondition'],
      countryImageUrl: data['countryImageUrl'],
    );
  }
}

class ProductResponse {
  final List<WeatherModel> response;

  ProductResponse({required this.response});
  factory ProductResponse.fromJson(Map<String, dynamic> data) {
    return ProductResponse(
      response: (data['country'] as List)
          .map((item) => WeatherModel.fromJson(item))
          .toList(),
    );
  }
}
