import 'package:flutter/material.dart';
import 'package:shopping_app/Models/book_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.bModel});
  final BookModel bModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${bModel.title} Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(bModel.imageUrl, height: 400),
              SizedBox(height: 16),
              Text(bModel.title),
              Text(' Written by : ${bModel.author}'),
              Text(
                bModel.price.toString(),
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(bModel.description),
            ],
          ),
        ),
      ),
    );
  }
}
