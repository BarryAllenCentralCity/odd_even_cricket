import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odd_even_cricket/homePage.dart';

String batorBowl = '';

class VSComputer extends StatelessWidget {
  VSComputer(String tossResult) {
    batorBowl = tossResult;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odd Eve',
      home: VSComputerLayout(),
    );
  }
}

class VSComputerLayout extends StatefulWidget {
  const VSComputerLayout({super.key});

  @override
  State<VSComputerLayout> createState() => _VSComputerLayoutState();
}

class _VSComputerLayoutState extends State<VSComputerLayout> {
  List<int> choiceNums = [1, 2, 3, 4, 5, 6];

  int playerScore = 0;
  int computerScore = 0;
  int compChoice = 0;
  int playerChoice = 0;

  bool computerOut = false;
  bool playerOut = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/bg/game.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // confirmation dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Exit to Home Screen'),
                  content: Text('Are you sure you want to exit?'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Yes'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: 50,
          ),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Vs Computer', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Player: $playerScore' + (playerOut ? ' - Out' : '*'),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      'Computer: $computerScore' +
                          (computerOut ? ' - Out' : '*'),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      'Player is ${batorBowl}ing',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Choose Your Move: 1, 2, 3, 4, 5, 6',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Spacer(),
                        GestureDetector(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('lib/assets/1.png'),
                                  fit: BoxFit.cover,
                                  invertColors: true,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onTap: () {
                              playerChoice = 1;
                              runPlay(1);
                            }),
                        Spacer(),
                        GestureDetector(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('lib/assets/2.png'),
                                  invertColors: true,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onTap: () {
                              playerChoice = 2;
                              runPlay(2);
                            }),
                        Spacer(),
                        GestureDetector(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('lib/assets/3.png'),
                                  invertColors: true,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onTap: () {
                              playerChoice = 3;
                              runPlay(3);
                            }),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Spacer(),
                        GestureDetector(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('lib/assets/4.png'),
                                  invertColors: true,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onTap: () {
                              playerChoice = 4;
                              runPlay(4);
                            }),
                        Spacer(),
                        GestureDetector(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('lib/assets/5.png'),
                                  invertColors: true,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onTap: () {
                              playerChoice = 5;
                              runPlay(5);
                            }),
                        Spacer(),
                        // Add the code for choice 6 here
                        GestureDetector(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('lib/assets/6.png'),
                                  invertColors: true,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onTap: () {
                              playerChoice = 6;
                              runPlay(6);
                            }),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Spacer(),
                  Column(
                children: <Widget>[
                  Text('Your choice'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/$playerChoice.png'),
                        invertColors: false,
                      ),
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Text('Computer\'s choice'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/$compChoice.png'),
                        invertColors: false,
                      ),
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
              Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void runPlay(int playerChoice) {
    if (batorBowl == 'bat' && playerOut == false) {
      computerBowls(playerChoice);
    } else if (batorBowl == 'bowl' && computerOut == false) {
      computerBats(playerChoice);
    } else if (playerOut == true && computerOut == true) {
      announceResult();
    }

    if (playerOut == true && computerScore > playerScore) {
      announceResult();
    }

    if (computerOut == true && playerScore > computerScore) {
      announceResult();
    }
  }

  void computerBats(int playerChoice) {
    Random random = new Random();
    int computerChoice = random.nextInt(6) + 1;
    setState(() {
      compChoice = computerChoice;
    });

    if (computerChoice == playerChoice) {
      setState(() {
        computerOut = true;
        batorBowl = 'bat';
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Computer is out'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ));
    } else {
      setState(() {
        computerScore += computerChoice;
      });
    }
  }

  void computerBowls(int playerChoice) {
    Random random = new Random();
    int computerChoice = random.nextInt(6) + 1;

    setState(() {
      compChoice = computerChoice;
    });

    if (computerChoice == playerChoice) {
      setState(() {
        playerOut = true;
        batorBowl = 'bowl';
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('You are out'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ));
    } else {
      setState(() {
        playerScore += playerChoice;
      });
    }
  }

  void announceResult() {
    if (playerScore > computerScore) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('You Win'),
              content: Text('You won the match'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text('Close'),
                ),
              ],
            );
          });
    } else if (playerScore < computerScore) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('You Lose'),
              content: Text('Computer won the match'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text('Close'),
                ),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Match Draw'),
              content: Text('The match is a draw'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text('Close'),
                ),
              ],
            );
          });
    }
  }
}
