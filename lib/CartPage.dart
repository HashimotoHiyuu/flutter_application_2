import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/list/models/CartModel.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("カート")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  leading: Image.asset(item.imagePath, width: 50),
                  title: Text(item.name),
                  subtitle: Text('¥${item.price} × ${item.quantity}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => cart.removeItem(item),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  '合計: ¥${cart.totalPrice}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (cart.items.isNotEmpty) {
                      cart.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('ご購入ありがとうございます')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('カートに商品がありません')),
                      );
                    }
                  },
                  child: const Text('購入する'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
