import 'package:flutter/material.dart';
import 'package:flutter_application_2/ThirdPage.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("スポーツを選択")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("サッカー"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdPage(sport: "soccer"),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text("野球"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdPage(sport: "baseball"),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text("テニス"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdPage(sport: "tennis"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
