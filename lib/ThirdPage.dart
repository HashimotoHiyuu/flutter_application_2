import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  final String sport;

  const ThirdPage({super.key, required this.sport});

  @override
  Widget build(BuildContext context) {
    String imagePrefix = sport.toLowerCase();
    return Scaffold(
      appBar: AppBar(title: Text('$sport Gear')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Equipment for $sport:',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/images/${imagePrefix}_1.png', width: 200),
            const SizedBox(height: 10),
            Image.asset('assets/images/${imagePrefix}_2.png', width: 200),
            const SizedBox(height: 10),
            Image.asset('assets/images/${imagePrefix}_3.png', width: 200),
          ],
        ),
      ),
    );
  }
}
