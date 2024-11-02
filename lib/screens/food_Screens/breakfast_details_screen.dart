import 'package:flutter/material.dart';
import 'package:food_catering_service_app/models/product_model.dart';

class BreakfastDetailsScreen extends StatelessWidget {
  final List<Product> breakfast;

  const BreakfastDetailsScreen({Key? key, required this.breakfast}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Snacks")),
      body: ListView.builder(
        itemCount: breakfast.length,
        itemBuilder: (context, index) {
          final food = breakfast[index];
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
