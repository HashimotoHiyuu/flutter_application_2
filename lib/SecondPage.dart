import 'package:flutter/material.dart';
import 'ThirdPage.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("スポーツを選択")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("サッカー"),
              onPressed: () => _goToThird(context, "soccer"),
            ),
            ElevatedButton(
              child: const Text("野球"),
              onPressed: () => _goToThird(context, "baseball"),
            ),
            ElevatedButton(
              child: const Text("テニス"),
              onPressed: () => _goToThird(context, "tennis"),
            ),
          ],
        ),
      ),
    );
  }

  void _goToThird(BuildContext context, String sport) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ThirdPage(sport: sport)),
    );
  }
}
