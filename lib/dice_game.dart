import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class DiceGamePage extends StatefulWidget {
  const DiceGamePage({Key? key}) : super(key: key);

  @override
  _DiceGamePageState createState() => _DiceGamePageState();
}

class _DiceGamePageState extends State<DiceGamePage> {
  final random = Random.secure();
  int score = 0;
  int HighestScore =0;
  int diceSum = 0;
  bool isGameOver = false;
  final diceList = [
    'Pictures/d1.png',
    'Pictures/d2.png',
    'Pictures/d3.png',
    'Pictures/d4.png',
    'Pictures/d5.png',
    'Pictures/d6.png',
  ];
  int i1 = 0;
  int i2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Score: $score', style: TextStyle(fontSize: 40),),
          Text('Highest Score: $HighestScore', style: TextStyle(fontSize: 25),),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(diceList[i1], width: 100, height: 100,),
              Image.asset(diceList[i2], width: 100, height: 100,),
            ],
          ),
          Text('Dice Sum: $diceSum', style: TextStyle(fontSize: 20),),
          if(isGameOver)Text('GAME OVER', style: TextStyle(fontSize: 40, color: Colors.red, fontWeight: FontWeight.bold)),

          ElevatedButton(onPressed: _rollTheDice, child: Text('Roll')),
          if(isGameOver)ElevatedButton(onPressed: _playAgain, child: Text('Play Again')),
          
          Text('Rules: If your Dice Sum is 11, the game will be over.', style: TextStyle(fontStyle: FontStyle.italic))

        ],
      ),
    );
  }

  void _rollTheDice(){
    setState(() {
      i1 = random.nextInt(6);
      i2 = random.nextInt(6);

      diceSum = i1+i2+2;

      if(diceSum == 11){
        isGameOver = true;
        if(score>HighestScore){
          HighestScore = score;
        }
        else{
          HighestScore = HighestScore;
        }
        score = score;
      }
      else{
        score = score + diceSum;

      }

    });

    }

  void _playAgain(){
    setState(() {

      score = 0;
      diceSum = 0;

      isGameOver = false;
    });
  }

}
