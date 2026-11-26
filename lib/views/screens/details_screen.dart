import 'package:cached_network_image/cached_network_image.dart';
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
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImage(
                  height: 400,
                  width: 300,
                  fit: BoxFit.cover,
                  imageUrl: bModel.imageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, size: 50),
                ),
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
      ),
    );
  }
}
