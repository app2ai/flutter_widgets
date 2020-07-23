import 'package:flutter/material.dart';

class TwoPanelWidget extends StatefulWidget {
  final AnimationController controller;
  TwoPanelWidget({this.controller});

  @override
  _TwoPanelWidgetState createState() => _TwoPanelWidgetState();
}

class _TwoPanelWidgetState extends State<TwoPanelWidget> {
  static const header_height = 32.0;

  Animation<RelativeRect> getPanelAnim(BoxConstraints boxConstraints){
    final height = boxConstraints.biggest.height;
    final backPanelHgt = height - header_height;
    final frontPanelHgt = -header_height;

    return RelativeRectTween(
      begin: RelativeRect.fromLTRB(0.0, backPanelHgt, 0.0, frontPanelHgt),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(CurvedAnimation(parent: widget.controller, curve: Curves.linear, reverseCurve: Curves.linear));
  }

  Widget panels(BuildContext context, BoxConstraints constraints){
    final ThemeData theme = Theme.of(context);

    return Container(
      child: new Stack(
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
                "Back Panel",
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
            ),
            color: theme.primaryColor,
          ),
          PositionedTransition(
            rect: getPanelAnim(constraints),
            child: Material(
              color: Colors.white,
              elevation: 12.0,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  topLeft: Radius.circular(16.0)
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Center(
                        child: Text(
                          "Shop here",
                          style: Theme.of(context).textTheme.button,
                        )),
                    height: header_height,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Front Panel",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: panels,
    );
  }
}
