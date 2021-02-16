import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

import 'barriers.dart';
import 'package:flutter_app/sword down.dart';
import 'package:flutter_app/sword3.dart';
import 'package:flutter_app/sword3d.dart';
import 'package:flutter_app/sword2.dart';
import 'package:flutter_app/sword2d.dart';

import 'package:flutter_app/redjp.dart';
import 'package:flutter_app/blackjp.dart';
import 'package:flutter_app/greenjp.dart';
import 'package:flutter_app/outlinejp.dart';
import 'package:flutter_app/yelllowjp.dart';

import 'package:flutter_app/jpbotton.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gameHasStarted = false;
  double barrierXone = 1.8;
  double barrierXtwo = 1.8 + 1.5;
  double barrierXthree = 1.8 + 3;
  double barrierXfour = 1.8;
  double barrierXfive = 1.8 + 1.5;
  double barrierXsix = 1.8 + 3;
  bool gameStarted = false;
  int score = 0;
  int highscore = 0;
  var currrentColor = Colors.white;
  var boxcoolor = Colors.black;
  var whitecolor = Colors.white;
  dynamic currentjp = MyBird();
  dynamic chancenum = 0;
  dynamic chancenum2 = 0;
  dynamic chancenum3 = 0;


  @override
  void initState() {
    setState(() {
      birdYaxis = 0;
      time = 0;
      height = 0;
      initialHeight = birdYaxis;
      barrierXone = 1.8;
      barrierXtwo = 1.8 + 1.5;
      barrierXthree = 1.8 + 3;
      barrierXfour = 1.8;
      barrierXfive = 1.8 + 1.5;
      barrierXsix = 1.8 + 3;
      gameStarted = false;
      score = 0;
    });
  }




  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  bool checkLose() {
    if (birdYaxis < -1.3 ) {
      return true;
    }
    if (birdYaxis > 1.2 ) {
      return true;
    }
    if (barrierXfour < 0.40 && barrierXfour > -0.40) {
      if (birdYaxis < -0.40 || birdYaxis > 0.40) {
        return true;
      }
    }
    if (barrierXfive < 0.40 && barrierXfive > -0.40) {
      if (birdYaxis < -0.50 || birdYaxis > -0.01) {
        return true;
      }
    }
    if (barrierXsix < 0.40 && barrierXsix > -0.40) {
      if (birdYaxis < 0.01 || birdYaxis > 0.50) {
        return true;
      }
    }
    return false;
  }
  bool boxcolor() {
    if (whitecolor == currrentColor) {
        boxcoolor = Colors.black;
    } else {
      boxcoolor = Colors.white;
    }
    return boxcolor();
  }

 void rarejp(){
    setnumber();
    setnumber2();
    setnumber3();
    if (chancenum2 == 50 && chancenum3 == 100) {
      setRandomjplogo();
    } else {
      currentjp = MyBird();
    }
 }
 void rareback() {
   if (chancenum == 8 && chancenum2 == 80) {
     currrentColor = Colors.red;
   } else {
     setRandomColor();
   }
 }



  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
        time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYaxis = initialHeight - height;
        if (barrierXone < 0 && barrierXone > -0.03) {
          score++;
        }
        if (barrierXtwo < 0 && barrierXtwo > -0.03) {
          score++;
        }
        if (barrierXthree < 0 && barrierXthree > -0.03) {
          score++;
        }


        if (barrierXone < -2) {

          barrierXone += 4.5;
        } else {
          barrierXone -= 0.04;
        }
        if (barrierXfour < -2) {

          barrierXfour += 4.5;
        } else {
          barrierXfour -= 0.04;
        }
        if (barrierXtwo < -2) {



          barrierXtwo += 4.5;
        } else {
          barrierXtwo -= 0.04;
        }
        if (barrierXfive < -2) {


          barrierXfive += 4.5;
        } else {
          barrierXfive -= 0.04;
        }
        if (barrierXthree < -2) {

          barrierXthree += 4.5;
        } else {
          barrierXthree -= 0.04;
        }
        if (barrierXsix < -2) {

          barrierXsix += 4.5;
        } else {
          barrierXsix -= 0.04;
        }

      });
      if (birdYaxis > 1.3 || checkLose()) {
        timer.cancel();
        _showDialog();
      }
    });
  }
  var colors = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.white,
  ];

  setRandomColor(){
    var rnd = Random().nextInt(colors.length);
    setState(() {
      currrentColor = colors[rnd];
    });
  }

  var logos = [
    Blackjp(),
    Greenjp(),
    Outlinejp(),
    Yellowjp(),
  ];
  setRandomjplogo(){
    var rjp = Random().nextInt(logos.length);
    setState(() {
      currentjp = logos[rjp];
    });
  }

  var numlist = [1,2,3,4,5,6,7,8,9,];
  var numlist2 = [10,20,30,40,50,60,70,80,90,];
  var numlist3 = [0,100,];

  setnumber(){
    var num = Random().nextInt(numlist.length);
    setState(() {
      chancenum = numlist[num];
    });
  }
  setnumber2(){
    var num2 = Random().nextInt(numlist2.length);
    setState(() {
      chancenum2 = numlist2[num2];
    });
  }
  setnumber3(){
    var num3 = Random().nextInt(numlist3.length);
    setState(() {
      chancenum3 = numlist3[num3];
    });
  }


  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[800],
            title: Text(
              "GAME OVER",
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              "Score: " + score.toString(),
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  customLaunch('https://jpscooters.co');
                },
                child: JPbotton()
              ),
              FlatButton(
                child: Text(
                  "PLAY AGAIN",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  rarejp();
                  rareback();
                  if (score > highscore) {
                    highscore = score;
                  }
                  initState();
                  setState(() {
                    gameHasStarted = false;
                  });
                  Navigator.of(context).pop();
                  boxcolor();
                },
              )
            ],
          );
        });
  }

  void customLaunch(command) async{
    if(await canLaunch(command)){
      await launch(command);
    }else{
      print('could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: Alignment(0, birdYaxis),
                      duration: Duration(milliseconds: 0),
                      color: currrentColor,
                      child: currentjp,
                    ),
                    Container(
                      alignment: Alignment(0, -0.3),
                      child: gameHasStarted
                          ? Text(" ")
                          : Text("T A P  T O  P L A Y",
                          style:
                          TextStyle(fontSize: 20, color: boxcoolor)),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXone, 1.20),
                      duration: Duration(milliseconds: 0),
                      child: Sword3(
                        size: 200.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXtwo, 1.90),
                      duration: Duration(milliseconds: 0),
                      child: MyBarrier(
                        size: 300.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXthree, 1.20),
                      duration: Duration(milliseconds: 0),
                      child: Sword2(
                        size: 150.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXfour, -1.07),
                      duration: Duration(milliseconds: 0),
                      child: Sword3d(
                        size: 150.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXfive, -1.17),
                      duration: Duration(milliseconds: 0),
                      child: Sword2d(
                        size: 150.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXsix, -1.82),
                      duration: Duration(milliseconds: 0),
                      child: Sword5d(
                        size: 300.0,
                      ),
                    )
                  ],
                )),
            Container(
              height: 15,
              color: boxcoolor,
            ),
            Expanded(
              child: Container(
                color: currrentColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SCORE",
                            style:
                            TextStyle(color: boxcoolor, fontSize: 20)),
                        SizedBox(
                          height: 20,
                        ),
                        Text(score.toString(),
                            style:
                            TextStyle(color: boxcoolor, fontSize: 35)),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("BEST",
                            style:
                            TextStyle(color: boxcoolor, fontSize: 20)),
                        SizedBox(
                          height: 20,
                        ),
                        Text(highscore.toString(),
                            style:
                            TextStyle(color: boxcoolor, fontSize: 35)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
                color: currrentColor,
              alignment: Alignment(0,0.5),
              child: gameHasStarted
                  ? Text(" ")
                  : Text("code: Like Apps",
                  style:
                  TextStyle(fontSize: 20, color: boxcoolor)),
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

