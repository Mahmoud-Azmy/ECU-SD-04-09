import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final WeatherModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(product.weatherImageUrl, height: 200, width: 200),
            SizedBox(height: 16),
            Text(product.name),
            Text('Temp:  ${product.tempreature}°C'),
            Text(product.weatherCondition),
          ],
        ),
      ),
    );
  }
}
