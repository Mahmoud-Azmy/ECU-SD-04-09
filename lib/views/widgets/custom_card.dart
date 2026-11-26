import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/weather_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.wModel});
  final WeatherModel wModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CachedNetworkImage(
              height: 80,
              width: 100,
              fit: BoxFit.fitHeight,
              imageUrl: wModel.countryImageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error, size: 50),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(wModel.name, maxLines: 1, overflow: TextOverflow.ellipsis),
                Text('${wModel.tempreature}°C'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
