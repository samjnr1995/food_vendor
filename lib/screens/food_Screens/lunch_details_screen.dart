import 'package:flutter/material.dart';
import 'package:food_catering_service_app/models/product_model.dart';

class LunchDetailsScreen extends StatelessWidget {
  final List<Product> lunch;

  const LunchDetailsScreen({Key? key, required this.lunch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Snacks")),
      body: ListView.builder(
        itemCount: lunch.length,
        itemBuilder: (context, index) {
          final food = lunch[index];
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
