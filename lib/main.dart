import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: const Text('Are You Lucky?'),
          backgroundColor: Colors.pinkAccent,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> with TickerProviderStateMixin {
  int left = 1;
  int right = 1;
  double turn = 0.0;
  int speed = 5;
  int duration = 1000;
  bool isWin = true;

  void DiceValues() {
    setState(() {
      left = 1 + Random().nextInt(6);
      right = 1 + Random().nextInt(6);
      isWin = left == right;
    });
  }

  void Rotation() {
    setState(() {
      turn += speed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedRotation(
                  turns: turn,
                  duration: Duration(milliseconds: duration),
                  onEnd: DiceValues,
                  child: TextButton(
                      onPressed: Rotation,
                      child: Image.asset('image/dice$left.png')),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedRotation(
                  turns: -turn,
                  duration: Duration(milliseconds: duration),
                  onEnd: DiceValues,
                  child: TextButton(
                      onPressed: Rotation,
                      child: Image.asset('image/dice$right.png')),
                ),
              ),
            ),
          ],
        ),
        Text(
          'RESULT: ${isWin ? 'WIN' : 'LOSE'}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
