// models/CartModel.dart
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
    // 同じ商品がある場合は数量を増やす
    final index = _items.indexWhere((item) => item.name == name);
    if (index != -1) {
      _items[index].quantity += quantity;
    } else {
      _items.add(CartItem(name: name, price: price, quantity: quantity));
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      notifyListeners();
    }
  }

  int get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.price * item.quantity);
  }
}
