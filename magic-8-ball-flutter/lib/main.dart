import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Ask Me Anything"),
            backgroundColor: Colors.blue.shade500,
          ),
          body: MagicBallPage(),
        ),
      ),
    );

class MagicBallPage extends StatefulWidget {
  @override
  _MagicBallPageState createState() => _MagicBallPageState();
}

class _MagicBallPageState extends State<MagicBallPage> {
  int ballNumber = 1;

  void randomizeBallNumber() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade900,
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: FlatButton(
          onPressed: randomizeBallNumber,
          child: Image.asset('images/ball$ballNumber.png'),
        ),
      ),
    );
  }
}
