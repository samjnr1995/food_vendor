import 'package:flutter/material.dart';
import 'package:food_catering_service_app/models/product_model.dart';

class DinnerDetailsScreen extends StatelessWidget {
  final List<Product> dinner;

  const DinnerDetailsScreen({Key? key, required this.dinner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Snacks")),
      body: ListView.builder(
        itemCount: dinner.length,
        itemBuilder: (context, index) {
          final food = dinner[index];
          return ListTile(
            title: Text(food.name),
            subtitle: Text(food.about),
            leading: Image.asset(food.imagePath),
          );
        },
      ),
    );
  }
}
