import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/list/models/CartModel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 商品データのリストを定義
    final products = [
      {
        'name': 'サッカーボール',
        'price': 3000,
        'image': 'assets/images/soccer.png',
      },
      {
        'name': 'バスケットボール',
        'price': 3500,
        'image': 'assets/images/basketball.png',
      },
      {
        'name': 'テニスラケット',
        'price': 5000,
        'image': 'assets/images/tennis.png',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('商品一覧'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  // 商品画像
                  Image.asset(
                    product['image'] as String,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16.0),
                  // 商品名・価格
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'] as String,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '${product['price']}円',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  // 「カートに追加」ボタン
                  ElevatedButton(
                    child: Text('カートに追加'),
                    onPressed: () {
                      // CartModel の addItem を呼び出す
                      context.read<CartModel>().addItem(
                            product['name'] as String,
                            product['price'] as int,
                            1,
                          );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
