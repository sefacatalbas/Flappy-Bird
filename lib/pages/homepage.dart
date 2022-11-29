import 'dart:async';
import 'package:flutter/material.dart';
import './bird.dart';
import 'barriers.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = 0;
  bool gameHasStarted = false;
  static double barrierXone = 1;
  double barrierXtwo = barrierXone + 1.5;

  void jump() {
    setState(() {});
  }

  void startGame() {
    gameHasStarted = true;
    initialHeight = birdYaxis;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYaxis = initialHeight - height;
        setState(() {
          birdYaxis = initialHeight - height;
        });
        setState(() {
          if (barrierXone < -2) {
            barrierXone += 3.5;
          } else {
            barrierXone -= 0.5;
          }
        });
        setState(() {
          if (barrierXtwo < -2) {
            barrierXtwo += 3.5;
          } else {
            barrierXtwo -= 0.5;
          }
        });
        if (birdYaxis > 1) {
          timer.cancel();
          gameHasStarted = false;
        }
      });
      if (birdYaxis > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            flex: 2,
            child: Stack(
              children: [
                GestureDetector(
                  child: AnimatedContainer(
                    alignment: Alignment(0, birdYaxis),
                    duration: Duration(milliseconds: 0),
                    color: Colors.blue,
                    child: Center(child: MyBird()),
                  ),
                ),
                Container(
                  alignment: Alignment(0, -0.3),
                  child: gameHasStarted
                      ? Text(" ")
                      : Text(
                          "TAP TO PLAY",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                ),
                AnimatedContainer(
                  alignment: Alignment(barrierXone, 1.1),
                  duration: Duration(milliseconds: 0),
                  child: MyBarrier(
                    size: 200.0,
                  ),
                ),
                AnimatedContainer(
                  alignment: Alignment(barrierXone, -1.1),
                  duration: Duration(milliseconds: 0),
                  child: MyBarrier(
                    size: 200.0,
                  ),
                ),
                AnimatedContainer(
                  alignment: Alignment(barrierXtwo, 1.1),
                  duration: Duration(milliseconds: 0),
                  child: MyBarrier(
                    size: 150.0,
                  ),
                ),
                AnimatedContainer(
                  alignment: Alignment(barrierXtwo, -1.1),
                  duration: Duration(milliseconds: 0),
                  child: MyBarrier(
                    size: 250.0,
                  ),
                ),
              ],
            )),
        Container(height: 15, color: Colors.green),
        Expanded(
          child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("SCORE",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: 20,
                      ),
                      Text("0",
                          style: TextStyle(color: Colors.white, fontSize: 35)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("BEST",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: 20,
                      ),
                      Text("54",
                          style: TextStyle(color: Colors.white, fontSize: 35)),
                    ],
                  ),
                ],
              )),
        ),
      ],
    ));
  }
}
