import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odd_even_cricket/computerPlay.dart';

class Toss extends StatelessWidget {
  const Toss({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toss',
      home: TossLayout(),
    );
  }
}

class TossLayout extends StatefulWidget {
  const TossLayout({super.key});

  @override
  State<TossLayout> createState() => _TossLayoutState();
}

class _TossLayoutState extends State<TossLayout> {
  String playerChoice = '';
  bool playerWins = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/bg/toss.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Toss', style: TextStyle(fontSize: 30, color: Colors.blue[800]),),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.limeAccent.withOpacity(0.1),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Choose Heads or Tails', style: TextStyle(fontSize: 30, color: Colors.blue[200]), textAlign: TextAlign.center),
              SizedBox(height: 20,),
              Container(
                child: Column(
                  children: [
                    GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Text('Heads', style: TextStyle(fontSize: 20, color: Colors.blue[200]),),
                          Image.asset(
                            'lib/assets/coin/heads.png',
                            height: 100,
                            width: 100,
                          ),
                        ],
                      ),
                      onTap: (){
                        TossCoin('heads');
                      }
                    ),
                    SizedBox(height: 15,),
                    GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Text('Tails', style: TextStyle(fontSize: 20, color: Colors.blue[100]),),
                          Image.asset(
                            'lib/assets/coin/tails.png',
                            height: 100,
                            width: 100,
                          ),
                        ],
                      ),
                      onTap: (){
                        TossCoin('tails');
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void TossCoin(String playerChoice) {
    // random number generator
    // if heads or tails
    // if player wins or computer wins
    Random random = new Random();
    int toss = random.nextInt(2);

    int choice = playerChoice == 'heads' ? 0 : 1;

    if (toss == choice) {
      // player wins
      playerWins = true;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('You Win'),
              content: Text('You won the toss , choose'),
              actions: <Widget>[
                GestureDetector(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Text('Bat', style: TextStyle(color: Colors.purple[800]),),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VSComputer('bat')));
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Text('Bowl', style: TextStyle(color: Colors.purple[800]),),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VSComputer('bowl')));
                  },
                ),
              ],
            );
          });
    } else {
      // computer wins
      playerWins = false;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('You Lose'),
              content: Text('Computer won the toss!!\nComputer chooses to bowl first'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VSComputer('bat')));
                  },
                  child: Text('Bat First!!'),
                ),
              ],
            );
          });
    }
  }
}
