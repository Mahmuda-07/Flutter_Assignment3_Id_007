import 'package:flutter/material.dart';
import 'coin_flip_clicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coin Flip Clicker',
      home: CoinFlipClicker(),
    );
  }
}
