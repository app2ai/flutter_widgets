import 'package:flutter/material.dart';
import 'package:least_count_demo/widget/DynamicWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final appTitle = "Flutter Widgets";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            RaisedButton(
              onPressed: ()=> _openWidget(1, "Expanded List"),
              child: Text("1. Expanded List", style: TextStyle(color: Colors.white),),
              color: Colors.deepOrange,
            ),
            RaisedButton(
              onPressed: ()=> _openWidget(2, "List View"),
              child: Text("2. List View", style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: ()=> _openWidget(3, "Slide Container Widget"),
              child: Text("3. Slide Container Widget", style: TextStyle(color: Colors.white),),
              color: Colors.red,
            ),
            RaisedButton(
              onPressed: ()=> _openWidget(4, "Staggered Grids"),
              child: Text("4. Staggered Grids", style: TextStyle(color: Colors.black),),
              color: Colors.greenAccent,
            ),
          ],
        ),
      )
    );
  }

  void _openWidget(int index, String title){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DynamicWidget(index, title)));
  }
}
