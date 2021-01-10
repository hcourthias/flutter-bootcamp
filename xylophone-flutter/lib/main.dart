import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  playLocal(int value) async {
    AudioCache audioCache = AudioCache();
    audioCache.play("note$value.wav");
  }

  Expanded buildKey({String note, int sound, Color color}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playLocal(sound);
        },
        child: Text(
          note,
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(note: "C", sound: 1, color: Colors.red),
              buildKey(note: "D", sound: 2, color: Colors.orange),
              buildKey(note: "E", sound: 3, color: Colors.yellow),
              buildKey(note: "F", sound: 4, color: Colors.green),
              buildKey(note: "G", sound: 5, color: Colors.teal),
              buildKey(note: "A", sound: 6, color: Colors.blue),
              buildKey(note: "B", sound: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
