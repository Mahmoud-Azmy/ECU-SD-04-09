import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final BookModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${product.title} Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.network(product.imageUrl, height: 400),
              SizedBox(height: 16),
              Text(product.title),
              Text(' Written by : ${product.author}'),
              Text(
                product.price.toString(),
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(product.description),
            ],
          ),
        ),
      ),
    );
  }
}
