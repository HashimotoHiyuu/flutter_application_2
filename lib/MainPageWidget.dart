import 'package:flutter/material.dart';
import 'list/CouponListView.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  bool _isSelectedItem = false;

  void openDetail() {
    setState(() => _isSelectedItem = true);
  }

  void closeDetail() {
    setState(() => _isSelectedItem = false);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CouponListView(openDetail),
        // if (_isSelectedItem) CouponDetail(closeDetail),
      ],
    );
  }
}
