import 'package:flutter/material.dart';

// 商品情報を表すクラス
class CartItem {
  final String name;
  final int price;
  final int quantity;
  final String imagePath;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imagePath,
  });
}

// カート全体を管理するクラス
class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // カートに商品を追加
  void addItem(String name, int price, int quantity, String imagePath) {
    _items.add(CartItem(
      name: name,
      price: price,
      quantity: quantity,
      imagePath: imagePath,
    ));
    notifyListeners();
  }

  // 商品を削除
  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  // カートを空にする
  void clear() {
    _items.clear();
    notifyListeners();
  }

  // 合計金額を計算
  int get totalPrice {
    return _items.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }
}
