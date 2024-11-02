import 'package:flutter/cupertino.dart';
import 'package:food_catering_service_app/models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _product = [
    Product(
      id: 6783488,
      name: 'Bhuna Khichuri and Thai Chicken',
      price: 40.45,
      rating: 4.8,
      calories: 150,
      about: 'Jollof rice is a unifying dish across West Africa. This classic Nigerian jollof rice recipe always has three things: rice, a tomato stew, and seasoning.',
      ingredients: 'This is an easy Nigerian fried rice recipe...',
      imagePath: 'assets/img-2.png',
      category: 'Lunch',
    ),
    Product(
      id: 087433,
      name: 'Mexican Vegetables and Salad',
      price: 80.90,
      rating: 4.3,
      calories: 168,
      about: 'Aromatic China dish that fragantly encapsulate...',
      ingredients: '4 cups of rice, 1kg Chicken/beef...',
      imagePath: 'assets/img-3.png',
      category: 'Dinner',
    ),
    Product(
      id: 123456,
      name: 'Chicken Salad Wrap',
      price: 25.00,
      rating: 4.5,
      calories: 120,
      about: 'A quick and easy chicken salad wrap.',
      ingredients: 'Grilled chicken, lettuce, tomato, and wrap.',
      imagePath: 'assets/img-5.png',
      category: 'Snacks',
    ),
    Product(
      id: 654321,
      name: 'Pancakes with Syrup',
      price: 15.00,
      rating: 4.7,
      calories: 200,
      about: 'Fluffy pancakes served with syrup.',
      ingredients: 'Flour, eggs, milk, syrup.',
      imagePath: 'assets/img-5.png',
      category: 'Breakfast',
    ),
  ];

  List<Product> get product => _product;

  List<Product> getSnacks() {
    return _product.where((product) => product.category == 'Snacks').toList();
  }

  List<Product> getBreakfast() {
    return _product.where((product) => product.category == 'Breakfast').toList();
  }

  List<Product> getLunch() {
    return _product.where((product) => product.category == 'Lunch').toList();
  }

  List<Product> getDinner() {
    return _product.where((product) => product.category == 'Dinner').toList();
  }
}
