import 'package:flutter/material.dart';
import 'package:least_count_demo/widget/two_panel.dart';

class BackDropLoginDemo extends StatefulWidget {
  @override
  _BackDropLoginDemoState createState() => _BackDropLoginDemoState();
}

class _BackDropLoginDemoState extends State<BackDropLoginDemo>
    with SingleTickerProviderStateMixin{

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(value: 1.0, vsync: this, duration: Duration(milliseconds: 60));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // It will check either animation completed or not
  bool get isPanelVisible{
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed || status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title:  Text("Backdrop Widget"),
          leading: IconButton(
            onPressed: ()=>  _controller.fling(velocity: isPanelVisible?-1.0:1.0),
            icon: AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: _controller.view,
            ),
          ),
        ),
        body: TwoPanelWidget(controller: _controller,),
      ),
    );
  }
}