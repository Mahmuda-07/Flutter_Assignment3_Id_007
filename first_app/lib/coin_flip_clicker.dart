
import 'dart:math';
import 'package:flutter/material.dart';

class CoinFlipClicker extends StatefulWidget {
  const CoinFlipClicker({super.key});

  @override
  State<CoinFlipClicker> createState() => _CoinFlipClickerState();
}

class _CoinFlipClickerState extends State<CoinFlipClicker> {
  int totalClicks = 0;
  int heads = 0;
  int tails = 0;
  String result = "";
  IconData coinIcon = Icons.monetization_on_outlined;

  void flipCoin() {
    final isHeads = Random().nextBool();
    setState(() {
      totalClicks++;
      if (isHeads) {
        heads++;
        result = "Heads";
        coinIcon = Icons.account_circle_outlined;  
      } else {
        tails++;
        result = "Tails";
        coinIcon = Icons.circle_outlined;  
      }
    });
  }

  void resetGame() {
    setState(() {
      totalClicks = 0;
      heads = 0;
      tails = 0;
      result = "";
      coinIcon = Icons.monetization_on_outlined;  
    });
  }

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 50),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Coin Flip Clicker"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 500,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Icon(
                    coinIcon,
                    size: 50,  
                    color: Colors.teal,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    result.isEmpty ? "Flip the coin!" : result,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),

                  const SizedBox(height: 25),

                  ElevatedButton(
                    onPressed: flipCoin,
                    style: buttonStyle,
                    child: const Text("Flip Coin"),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: resetGame,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text("Reset"),
                  ),
                  const SizedBox(height: 25),

                  Text("Heads: $heads", style: const TextStyle(fontSize: 18,
                  color: Colors.blueAccent)),
                  Text("Tails: $tails", style: const TextStyle(fontSize: 18,
                  color: Colors.blueAccent)),
                  Text(
                    "Total Flips: $totalClicks",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
