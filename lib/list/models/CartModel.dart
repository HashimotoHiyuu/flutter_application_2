import 'package:flutter/material.dart';

/// 商品情報を表すクラス
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

/// カート全体を管理するクラス
class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];
  final List<CartItem> _purchaseHistory = []; // 購入履歴を追加

  List<CartItem> get items => _items;
  List<CartItem> get purchaseHistory => _purchaseHistory;

  /// カートに商品を追加
  void addItem(String name, int price, int quantity, String imagePath) {
    _items.add(CartItem(
      name: name,
      price: price,
      quantity: quantity,
      imagePath: imagePath,
    ));
    notifyListeners();
  }

  // 商品の数量を変更する
  void updateQuantity(CartItem item, int newQuantity) {
    final index = _items.indexOf(item);
    if (index != -1) {
      _items[index] = CartItem(
        name: item.name,
        price: item.price,
        quantity: newQuantity,
        imagePath: item.imagePath,
      );
      notifyListeners();
    }
  }

  /// 商品を削除
  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  /// 購入処理：履歴に保存してカートを空にする
  void purchase() {
    _purchaseHistory.addAll(_items); // カートの中身を履歴へコピー
    _items.clear(); // カートを空にする
    notifyListeners();
  }

  /// 購入履歴をクリアする（任意）
  void clearHistory() {
    _purchaseHistory.clear();
    notifyListeners();
  }

  /// カート合計金額を計算
  int get totalPrice {
    return _items.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }
}
