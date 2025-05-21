import 'package:flutter/material.dart';
import 'DetailPage.dart';

class ThirdPage extends StatelessWidget {
  final String sport;
  const ThirdPage({super.key, required this.sport});

  @override
  Widget build(BuildContext context) {
    String prefix = sport.toLowerCase();

    return Scaffold(
      appBar: AppBar(title: Text('$sport Gear')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Equipment for $sport:',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(3, (index) {
                  String imageName = '${prefix}_${index + 1}.png';
                  String productName = '$sport Item ${index + 1}';
                  int price = (index + 1) * 1000; // 仮の金額設定

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailPage(
                            imageName: imageName,
                            productName: productName,
                            price: price,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Image.asset('assets/images/$imageName', width: 150),
                          const SizedBox(height: 5),
                          Text(productName),
                          Text('¥$price')
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
