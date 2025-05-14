import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  final String sport;

  const ThirdPage({super.key, required this.sport});

  void addToCart(BuildContext context, String itemName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$itemName をカートに追加しました'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String imagePrefix = sport.toLowerCase();

    return Scaffold(
      appBar: AppBar(title: Text('$sport Gear')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Equipment for $sport:',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => addToCart(context, '$sport グッズ1'),
                    child: Image.asset('assets/images/${imagePrefix}_1.png',
                        width: 200),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => addToCart(context, '$sport グッズ2'),
                    child: Image.asset('assets/images/${imagePrefix}_2.png',
                        width: 200),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => addToCart(context, '$sport グッズ3'),
                    child: Image.asset('assets/images/${imagePrefix}_3.png',
                        width: 200),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
