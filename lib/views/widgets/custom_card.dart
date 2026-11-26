import 'package:flutter/material.dart';
import 'package:shopping_app/Models/book_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.bModel});
  final BookModel bModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(bModel.imageUrl, height: 80),
            SizedBox(width: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bModel.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  bModel.price.toString(),
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.star, color: Colors.amber),
            Text(bModel.rate.toString()),
          ],
        ),
      ),
    );
  }
}
