import 'package:flutter/material.dart';

import '../models/snacks_model.dart';

class SnacksProvider extends ChangeNotifier {
  final List<Snacks> _snacks = [
    Snacks(
      name: 'Snacks',
      imagePath: 'assets/lunch.png', id: 2345777,
    ),
    Snacks(
      name: 'Breakfast',
      imagePath: 'assets/breakfast.png', id: 998654,
    ),
    Snacks(
      name: 'Lunch',
      imagePath: 'assets/snacks.png', id: 9864534,
    ),
    Snacks(
      name: 'Dinner',
      imagePath: 'assets/dinner.png', id: 087555,
    ),

  ];

  List<Snacks> get snacks => _snacks;

  void addProduct(Snacks snacks) {
    _snacks.add(snacks);
    notifyListeners();
  }

  void removeProduct(int id) {
    _snacks.removeWhere((snacks) => snacks.id == id);
    notifyListeners();
  }
}
