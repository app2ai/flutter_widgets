import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:least_count_demo/login_design/multicolors.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class BeautyLogin extends StatefulWidget {
  @override
  _BeautyLoginState createState() => _BeautyLoginState();
}

class _BeautyLoginState extends State<BeautyLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: Utils.multiColors()
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _title(),
              SizedBox(
                height: 20.0,
              ),
              _pageSwitcher()
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(){
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 1,
      text: TextSpan(
        text: 'Android',
        style: TextStyle(
          color: Colors.green,
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
        ),
        children:[
          TextSpan(
            text: '2',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: 'Ai',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
          )
        ]
      ),
    );
  }

  Widget _pageSwitcher(){
    return LiteRollingSwitch(
      value: true,
      colorOff: Colors.green,
      colorOn: Colors.orangeAccent,
      animationDuration: Duration(milliseconds: 500),
      iconOn: Icons.lock_open,
      iconOff: Icons.add_circle_outline,
      textOn: "Sign-In",
      textOff: "Sign-Up",
      textSize: 14.0,
      onChanged: (bool state) {
        print('Current State of SWITCH IS: $state');
      },
    );
  }
}
