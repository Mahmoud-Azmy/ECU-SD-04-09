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

  factory WeatherModel.fj(Map<String, dynamic> data) {
    return WeatherModel(
      id: data["id"],
      name: data["name"],
      tempreature: data["tempreature"],
      weatherImageUrl: data["weatherImageUrl"],
      countryImageUrl: data["countryImageUrl"],
      weatherCondition: data["weatherCondition"],
    );
  }
}

class WeatherResponse {
  final List<WeatherModel> wList;

  WeatherResponse({required this.wList});
  factory WeatherResponse.fj(Map<String, dynamic> data) {
    return WeatherResponse(
      wList: (data["country"] as List).map((item) {
        return WeatherModel.fj(item);
      }).toList(),
    );
  }
}
