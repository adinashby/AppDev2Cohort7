import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playsound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKey({Color? color, int? soundNumber}) {
    return Expanded(
      child: TextButton(
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
        onPressed: () {
          playsound(soundNumber ?? 1);
        },
        child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(color: Colors.red, soundNumber: 1),
                buildKey(color: Colors.orange, soundNumber: 2),
                buildKey(color: Colors.yellow, soundNumber: 3),
                buildKey(color: Colors.green, soundNumber: 4),
                buildKey(color: Colors.teal, soundNumber: 5),
                buildKey(color: Colors.blue, soundNumber: 6),
                buildKey(color: Colors.purple, soundNumber: 7),
              ]),
        ),
      ),
    );
  }
}

// Expanded(
// child: TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(Colors.red)),
// onPressed: () {
// playsound(1);
// },
// child: Text(''),
// ),
// ),
// Expanded(
// child: TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(Colors.orange)),
// onPressed: () {
// playsound(2);
// },
// child: Text(''),
// ),
// ),
// Expanded(
// child: TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(Colors.yellow)),
// onPressed: () {
// playsound(3);
// },
// child: Text(''),
// ),
// ),
// Expanded(
// child: TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(Colors.green)),
// onPressed: () {
// playsound(4);
// },
// child: Text(''),
// ),
// ),
// Expanded(
// child: TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(Colors.teal)),
// onPressed: () {
// playsound(5);
// },
// child: Text(''),
// ),
// ),
// Expanded(
// child: TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(Colors.blue)),
// onPressed: () {
// playsound(6);
// },
// child: Text(''),
// ),
// ),
// Expanded(
// child: TextButton(
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(Colors.purple)),
// onPressed: () {
// playsound(7);
// },
// child: Text(''),
// ),
// ),
