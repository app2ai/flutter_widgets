import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';


class BackDropLoginDemo extends StatefulWidget {
  @override
  _BackDropLoginDemoState createState() => _BackDropLoginDemoState();
}

class _BackDropLoginDemoState extends State<BackDropLoginDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BackdropScaffold(
        title: Text("BD login"),
        headerHeight: 50.0,frontLayerBorderRadius: BorderRadius.circular(10.0),
        backLayer: Center(child: Text("I am back cover"),),
        frontLayer: Center(child: Text("I am front cover"),),
      ),
    );
  }
}