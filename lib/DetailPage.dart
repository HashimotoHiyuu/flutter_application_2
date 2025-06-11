import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list/models/CartModel.dart';

class DetailPage extends StatefulWidget {
  final String imageName;
  final String productName;
  final int price;

  const DetailPage({
    super.key,
    required this.imageName,
    required this.productName,
    required this.price,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // 完全な画像パスを組み立てて変数に
    final String imagePath = 'assets/images/${widget.imageName}';

    return Scaffold(
      appBar: AppBar(title: Text(widget.productName)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, width: double.infinity, height: 200),
            const SizedBox(height: 20),
            Text(widget.productName, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text('¥${widget.price}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('数量:'),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() => quantity--);
                    }
                  },
                ),
                Text('$quantity'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() => quantity++);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // カートに追加
                Provider.of<CartModel>(context, listen: false).addItem(
                  widget.productName,
                  widget.price,
                  quantity,
                  imagePath, // ← 修正済み: 画像パスを渡す
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('カートに追加しました')),
                );
              },
              child: const Text('カートに入れる'),
            ),
          ],
        ),
      ),
    );
  }
}
