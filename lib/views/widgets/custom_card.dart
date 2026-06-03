import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.product});
  final WeatherModel product;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(product.countryImageUrl, height: 50),
            SizedBox(width: 20),
            Column(
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text('${product.tempreature}°C'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
