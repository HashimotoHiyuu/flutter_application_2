import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../list/models/CartModel.dart';

class PurchaseHistoryPage extends StatelessWidget {
  const PurchaseHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('購入履歴')),
      body: cart.purchaseHistory.isEmpty
          ? const Center(child: Text('購入履歴はまだありません'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: cart.purchaseHistory.length,
              itemBuilder: (context, index) {
                final item = cart.purchaseHistory[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Image.asset(item.imagePath, width: 50),
                    title: Text(item.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('¥${item.price} × ${item.quantity}'),
                        Text('合計: ¥${item.price * item.quantity}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
