import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/controllers/app_provider.dart';

import 'package:shopping_app/views/screens/details_screen.dart';
import 'package:shopping_app/views/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, AppProvider controller, _) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.errMessage != null) {
            return Center(child: Text(controller.errMessage!));
          } else {
            return ListView.builder(
              itemCount: controller.bList.length,

              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsScreen(wModel: controller.bList[index]);
                        },
                      ),
                    );
                  },
                  child: CustomCard(wModel: controller.bList[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
