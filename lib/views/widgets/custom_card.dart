import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.pModel});
  final ProductModel pModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CachedNetworkImage(
            height: 150,
            imageUrl: pModel.imageUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error, size: 50),
          ),
          SizedBox(height: 16),
          Text(pModel.name),
          SizedBox(height: 8),
          Text(
            "\$ ${pModel.price.toString()}",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
