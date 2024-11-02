import 'package:flutter/material.dart';
import 'package:food_catering_service_app/models/product_model.dart';

class SnacksDetailsScreen extends StatelessWidget {
  final List<Product> snacks;

  const SnacksDetailsScreen({Key? key, required this.snacks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Snacks")),
      body: ListView.builder(
        itemCount: snacks.length,
        itemBuilder: (context, index) {
          final snack = snacks[index];
          return ListTile(
            title: Text(snack.name),
            subtitle: Text(snack.about),
            leading: Image.asset(snack.imagePath),
          );
        },
      ),
    );
  }
}
