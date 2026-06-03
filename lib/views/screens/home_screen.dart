import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/controllers/get_products_provider.dart';
import 'package:shopping_app/views/screens/details_screen.dart';
import 'package:shopping_app/views/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, GetProductsProvider controller, _) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.errMessage != null) {
            return Center(child: Text(controller.errMessage!));
          } else {
            return ListView.builder(
              itemCount: controller.productsList.length,

              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsScreen(
                            product: controller.productsList[index],
                          );
                        },
                      ),
                    );
                  },
                  child: CustomCard(product: controller.productsList[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
