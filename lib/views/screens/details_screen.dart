import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/weather_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.wModel});
  final WeatherModel wModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wModel.name, style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              imageUrl: wModel.countryImageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error, size: 50),
            ),
            SizedBox(height: 16),
            Text(wModel.name),
            Text('Temp:  ${wModel.tempreature}°C'),
            Text(wModel.weatherCondition),
          ],
        ),
      ),
    );
  }
}
