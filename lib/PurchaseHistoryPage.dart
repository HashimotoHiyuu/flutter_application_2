import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/list/models/CartModel.dart';

class PurchaseHistoryPage extends StatelessWidget {
  const PurchaseHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final history = context.watch<CartModel>().purchaseHistory;

    return Scaffold(
      appBar: AppBar(title: const Text('購入履歴')),
      body: history.isEmpty
          ? const Center(child: Text('購入履歴はありません'))
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final item = history[index];
                return ListTile(
                  leading: Image.asset(item.imagePath, width: 50),
                  title: Text(item.name),
                  subtitle: Text('¥${item.price} × ${item.quantity}'),
                );
              },
            ),
    );
  }
}
