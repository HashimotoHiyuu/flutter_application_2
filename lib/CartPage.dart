// pages/CartPage.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list/models/CartModel.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("カート")),
      body: cart.items.isEmpty
          ? const Center(child: Text("カートに商品がありません"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('¥${item.price} x ${item.quantity}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () => cart.decreaseQuantity(item),
                            ),
                            Text('${item.quantity}'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => cart.increaseQuantity(item),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => cart.removeItem(item),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('合計金額: ¥${cart.totalPrice}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('注文が完了しました！')),
                          );
                          // 注文確定処理があればここに書く
                        },
                        child: const Text('注文する'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
