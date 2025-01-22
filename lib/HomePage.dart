import 'package:flutter/material.dart';
import 'FirstPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ホーム")),
      body: Center(
        child: TextButton(
          child: const Text("1ページ目に遷移する"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FirstPage()),
            );
          },
        ),
      ),
    );
  }
}
