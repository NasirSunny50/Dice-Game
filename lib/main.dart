import 'dart:ffi';

import 'package:dice_game/dice_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(0, 100, 0, 20),
              child: Text(
                'Dice Game',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Image.network(
              'https://theantijunecleaver.com/wp-content/uploads/2020/01/board-games-for-7-year-olds.jpg',
              width: double.infinity,
              height: 300,
            ),

            SizedBox(height: 50,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DiceGamePage()),
                  );
                },
                child: Text('Play')),
          ],
        ),
      ),
    );
  }
}

