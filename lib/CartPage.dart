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
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            leading: Image.asset('assets/images/$item', width: 50),
            title: Text(item.name),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => cart.remove(item),
            ),
          );
        },
      ),
    );
  }
}
