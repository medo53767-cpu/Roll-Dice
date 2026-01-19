import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int dicenumber = 1;
  void _rollDice() async {
  for (int i = 0; i < 10; i++) {
    setState(() {
      dicenumber = Random().nextInt(6) + 1;
    });
    await Future.delayed(Duration(milliseconds: 50));
  }
}


  @override
  Widget build(BuildContext context) {
    var activediceimage = 'assets/images/dice-$dicenumber.png';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pinkAccent, Colors.purpleAccent],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Image.asset(activediceimage, width: 250, height: 250),
                SizedBox(height: 20),
                TextButton.icon(
                  onPressed: _rollDice,
                  icon: const Icon(Icons.casino, color: Colors.white),
                  label: const Text(
                    'Roll Dice',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    backgroundColor: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
