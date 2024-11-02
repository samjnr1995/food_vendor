import 'package:food_catering_service_app/models/product_model.dart';

class CartModel {
  final Product product;
  int quantity;
  CartModel({required this.product, this.quantity = 1});

}