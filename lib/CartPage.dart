import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/list/models/CartModel.dart';
import 'PurchaseHistoryPage.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("カート")),
      body: Column(
        children: [
          // --- カートの商品一覧 or 空のメッセージ ---
          Expanded(
            child: cart.items.isEmpty
                ? const Center(child: Text("カートに商品がありません"))
                : ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: ListTile(
                          leading: Image.asset(item.imagePath, width: 50),
                          title: Text(item.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('¥${item.price}'),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      if (item.quantity > 1) {
                                        cart.updateQuantity(
                                            item, item.quantity - 1);
                                      }
                                    },
                                  ),
                                  Text('${item.quantity}'),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      cart.updateQuantity(
                                          item, item.quantity + 1);
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => cart.removeItem(item),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // --- 合計金額・購入ボタン・履歴ボタン ---
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '合計: ¥${cart.totalPrice}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // 購入ボタン（商品がある時のみ処理）
                ElevatedButton(
                  onPressed: () {
                    if (cart.items.isNotEmpty) {
                      cart.purchase(); // 購入処理 & 履歴保存
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('ご購入ありがとうございます')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('カートに商品がありません')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('購入する'),
                ),
                const SizedBox(height: 10),

                // 購入履歴ページへ
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const PurchaseHistoryPage()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('購入履歴を見る'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
