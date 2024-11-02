import 'package:flutter/cupertino.dart';

import '../models/dinner_model.dart';

class DinnerProvider extends ChangeNotifier {
  final List<Dinner> _dinner = [
    Dinner(
      price: 40.45,
      about:
          'Jollof rice is a unifying dish across West Africa. This classic Nigerian jollof rice recipe always has three things: rice, a tomato stew, and seasoning.',
      imagePath: 'assets/img-2.png',
      name: 'Bhuna Khichuri and Thai Chicken',
      rating: 4.8,
      calories: 150,
      id: 6783488,
      ingredients:
          'This is an easy Nigerian fried rice recipe, you can follow this recipe even if you are new to Nigerian cooking. I always serve fried rice with chicken. You can either grill or fry your chicken',
    ),
    Dinner(
      price: 80.90,
      about:
          'aromatic China dish that fragantly encapsulate the thought of every empathic marathon',
      imagePath: 'assets/img-3.png',
      name: 'Mexican Vegetables and Salad',
      rating: 4.3,
      calories: 168,
      id: 087433,
      ingredients:
          '4 cups of rice 1kg Chicken/beef 1000ml of Ground Fresh tomatoes. 50ml Ground Fresh peppers 1 Teaspoon Curry powder 1 teaspoon Thyme 1 teaspoon Nutmeg powder 2 seasoning cubes 1 cup of sliced onions 300ml vegetable salt to taste. 2 cloves of garlic 2 fingers of ginger Just wash, squeeze out water inside the tomatoes, blend as is, and set aside. You ...',
    ),
  ];
  List<Dinner> get dinner => _dinner;
}
