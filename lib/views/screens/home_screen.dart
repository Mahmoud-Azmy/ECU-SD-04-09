import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Controllers/app_provider.dart';
import 'package:shopping_app/views/screens/details_screen.dart';
import 'package:shopping_app/views/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products"), centerTitle: true),
      body: Consumer(
        builder: (context, AppProvider controller, child) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.msg != null) {
            return Center(child: Text(controller.msg!));
          } else {
            return GridView.builder(
              itemCount: controller.pList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(pModel: controller.pList[index]),
                      ),
                    );
                  },
                  child: CustomCard(pModel: controller.pList[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
