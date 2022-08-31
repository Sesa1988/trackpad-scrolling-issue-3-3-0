import 'package:flutter/material.dart';
import 'package:trackpad_issue/market/market_tab_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PointerDeviceKind.trackpad missing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MarketTabNavigation(),
    );
  }
}
