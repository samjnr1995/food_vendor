import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';
import 'package:food_catering_service_app/models/cart_model.dart';
import 'package:food_catering_service_app/models/product_model.dart';

class CartModelProvider extends ChangeNotifier {

  final List<CartModel> _cartItems = [];

  List<CartModel> get cartItems => _cartItems;


  void addToCart(Product product, int quantity,) {
    var existingCartItem = _cartItems.firstWhereOrNull(
      (item) => item.product.id == product.id,
    );
    if (existingCartItem != null) {
      existingCartItem.quantity += quantity;
    } else {
      _cartItems.add(CartModel(product: product, quantity: quantity));
    }

    notifyListeners();
  }

  int getProductQuantity(int productId) {
    int quantity = 0;
    for (CartModel item in _cartItems) {
      if (item.product.id == productId) {
        quantity += item.quantity;
      }
    }
    return quantity;
  }
  int get uniqueProductCount {
    return _cartItems.length;
  }


  int get cartCount {
    return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  double get totalPrice {
    return _cartItems.fold(
        0.0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  void updateCartItemQuantity(int index, int newQuantity) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  void increaseCartItemQuantity(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseCartItemQuantity(int index) {
    if (index >= 0 && index < _cartItems.length) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
        notifyListeners();
      } else {
        _cartItems.removeAt(index);
        notifyListeners();
      }
    }
  }

  void removeCartItem(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  List<CartModel> getCartItemsList() {
    return List<CartModel>.from(_cartItems);
  }
}
