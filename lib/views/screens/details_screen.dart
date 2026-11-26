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
        backgroundColor: Colors.orange,
        title: Text(wModel.name, style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImage(
                  height: 200,
                  width: 300,
                  fit: BoxFit.fill,
                  imageUrl: wModel.weatherImageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, size: 50),
                ),
                SizedBox(height: 16),
                Text(wModel.name),
                Text('Temp:  ${wModel.tempreature}°C'),
                Text(wModel.weatherCondition),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
