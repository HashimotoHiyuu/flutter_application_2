import 'package:flutter/material.dart';

// カートに入れる商品を表すクラス
class CartItem {
  final String name;
  final int price;
  int quantity;
  final String imagePath;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imagePath,
  });
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(String name, int price, int quantity, String imagePath) {
    // すでに同じ商品が入っていたら数量だけ増やす
    for (var item in _items) {
      if (item.name == name) {
        item.quantity += quantity;
        notifyListeners();
        return;
      }
    }

    _items.add(CartItem(
      name: name,
      price: price,
      quantity: quantity,
      imagePath: imagePath,
    ));
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  int get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);
}
