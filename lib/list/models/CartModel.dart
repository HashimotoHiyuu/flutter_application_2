import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final int price;
  int quantity;

  CartItem({required this.name, required this.price, this.quantity = 1});
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(String name, int price, int quantity) {
    final existing = _items.indexWhere((item) => item.name == name);
    if (existing != -1) {
      _items[existing].quantity += quantity;
    } else {
      _items.add(CartItem(name: name, price: price, quantity: quantity));
    }
    notifyListeners();
  }

  void removeItem(String name) {
    _items.removeWhere((item) => item.name == name);
    notifyListeners();
  }

  void updateQuantity(String name, int newQty) {
    final index = _items.indexWhere((item) => item.name == name);
    if (index != -1) {
      _items[index].quantity = newQty;
      notifyListeners();
    }
  }

  int get totalPrice => _items.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );
}
