import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Color.fromRGBO(20, 29, 38, 1),
      appBar: AppBar(
        title: Text("I Am Rich"),
        backgroundColor: Color.fromRGBO(20, 29, 38, 1),
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/diamond.png'),
        ),
      ),
    ),
  ));
}
