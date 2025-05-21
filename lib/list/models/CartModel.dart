import 'package:flutter/material.dart';

// 商品1つ分の情報を持つクラス
class CartItem {
  final String name;
  final int price;
  int quantity;

  CartItem({required this.name, required this.price, required this.quantity});
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(String name, int price, int quantity) {
    // すでに同じ商品がある場合、数量だけ増やす
    final existingItem = _items.firstWhere(
      (item) => item.name == name,
      orElse: () => CartItem(name: '', price: 0, quantity: 0),
    );

    if (existingItem.name != '') {
      existingItem.quantity += quantity;
    } else {
      _items.add(CartItem(name: name, price: price, quantity: quantity));
    }
    notifyListeners();
  }

  void remove(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void updateQuantity(CartItem item, int quantity) {
    item.quantity = quantity;
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  int get totalPrice =>
      _items.fold(0, (total, item) => total + (item.price * item.quantity));
}
