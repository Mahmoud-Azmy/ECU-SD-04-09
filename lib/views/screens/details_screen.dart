import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.pModel});
  final ProductModel pModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImage(
                  height: 150,
                  imageUrl: pModel.imageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                  errorWidget: (context, url, error) =>
                      SizedBox(height: 150, child: Icon(Icons.error)),
                ),
                SizedBox(height: 20),
                Text(pModel.name),
                SizedBox(height: 10),
                Text(
                  "\$ ${pModel.price.toString()}",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(pModel.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
