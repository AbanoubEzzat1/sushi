import 'package:flutter/material.dart';
import 'package:sushi/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: "Salamon sushi",
      price: "9.99",
      imagePath: "assets/images/single_sushi.png",
      rating: "4.5",
    ),
    Food(
      name: "Tuna",
      price: "20.99",
      imagePath: "assets/images/sushi.png",
      rating: "4.8",
    ),
    Food(
      name: "Salamon sushi",
      price: "18.99",
      imagePath: "assets/images/single_sushi.png",
      rating: "4.5",
    ),
    Food(
      name: "Tuna",
      price: "23.99",
      imagePath: "assets/images/sushi.png",
      rating: "3.9",
    ),
  ];

  List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food food, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(food);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
