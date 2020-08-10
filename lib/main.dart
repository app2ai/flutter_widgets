import 'dart:async';

import 'package:flutter/material.dart';
import 'package:least_count_demo/widget/DynamicWidget.dart';
import 'package:least_count_demo/widget/bd_login.dart';
import 'package:least_count_demo/widget/navigation_rail.dart';
import 'login_design/login.dart' show BeautyLogin;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final appTitle = "Flutter Widgets";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot) =>
          MaterialApp(
            debugShowCheckedModeBanner: false,
            title: appTitle,
            theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
            home: MyHomePage(appTitle, snapshot),
          ),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  final String title;
  AsyncSnapshot<dynamic> snapshot;
  MyHomePage(this.title, this.snapshot);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text("Theme"),
                trailing: Switch(
                  value: widget.snapshot.data,
                  onChanged: bloc.changeTheme,
                ),
              )
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              RaisedButton(
                onPressed: ()=> _openWidget(1, "Expanded List", context),
                child: Text("1. Expanded List", style: TextStyle(color: Colors.white),),
                color: Colors.deepOrange,
              ),
              RaisedButton(
                onPressed: ()=> _openWidget(2, "List View", context),
                child: Text("2. List View", style: TextStyle(color: Colors.white),),
                color: Colors.blue,
              ),
              RaisedButton(
                onPressed: ()=> _openWidget(3, "Slide Container Widget", context),
                child: Text("3. Slide Container Widget", style: TextStyle(color: Colors.white),),
                color: Colors.red,
              ),
              RaisedButton(
                onPressed: ()=> _openWidget(4, "Staggered Grids", context),
                child: Text("4. Staggered Grids", style: TextStyle(color: Colors.black),),
                color: Colors.greenAccent,
              ),
              RaisedButton(
                onPressed: ()=> _openWidget(5, "Backdrop Login", context),
                child: Text("5. Backdrop Login", style: TextStyle(color: Colors.white),),
                color: Colors.black54,
              ),
              RaisedButton(
                onPressed: ()=> _openWidget(6, "Tween and Animated Builder", context),
                child: Text("6. Tween and Animated Builder", style: TextStyle(color: Colors.white),),
                color: Colors.purple,
              ),
              RaisedButton(
                onPressed: ()=> _openWidget(7, "Row & Column Widget", context),
                child: Text("7. Row & Column Widget", style: TextStyle(color: Colors.black),),
                color: Colors.orange,
              ),
              RaisedButton(
                onPressed: ()=> _openWidget(8, "Beauty Login", context),
                child: Text("8. Beauty Login", style: TextStyle(color: Colors.black),),
                color: Colors.blue,
              ),
              RaisedButton(
                onPressed: ()=> _openWidget(9, "Navigation Rail", context),
                child: Text("9. Navigation Rail", style: TextStyle(color: Colors.black),),
                color: Colors.greenAccent,
              ),
              RaisedButton(
                onPressed: ()=> _openWidget(10, "Transform", context),
                child: Text("10. Transform", style: TextStyle(color: Colors.black),),
                color: Colors.cyan,
              ),
            ],
          ),
        )
    );
  }

  void _openWidget(int index, String title, BuildContext context){
    if(index == 5){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BackDropLoginDemo()));
      return;
    }
    if(index == 8){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BeautyLogin()));
      return;
    }
    if(index == 9){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NavRail()));
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DynamicWidget(index, title)));
  }
}

class Bloc{
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();