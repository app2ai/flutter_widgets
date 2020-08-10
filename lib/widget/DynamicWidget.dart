import 'dart:math' as math;
import 'package:backdrop/backdrop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DynamicWidget extends StatefulWidget {
  final index;
  final title;
  DynamicWidget(this.index, this.title);

  @override
  _DynamicWidgetState createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  var sz = 300.0;
  final fastMotion = 1;
  final slowMotion = 10;
  final fast = 1500;
  double initValue = 24.0;
  bool isRow = false;
  Color pressedColor = Colors.teal;
  Color controlColor = Colors.purple;
  MainAxisAlignment mainAxisAlisgn = MainAxisAlignment.start;

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(seconds: slowMotion), vsync: this)
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: widget?.title,
      theme: ThemeData(
          primaryColor: Colors.deepOrange,
          accentColor: Colors.deepOrangeAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget?.title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: _getIndexedWidget(widget.index),
      ),
    );
  }

  Widget _getIndexedWidget(int i) {
    switch (i) {
      case 1:
        return _expantionListView();
      case 2:
        return _listView();
      case 3:
        return _theContainer();
      case 4:
        return _staggredGridView();
      case 5:
        return _backdrop();
      case 6:
        return _animBuilder();
      case 7:
        return _rowVsColumn();
      case 10:
        return _transform();
    }
    return null;
  }

  Widget _transform(){
      return Center(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.skewY(0.3)..rotateZ(-math.pi/12.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color(0xFFE8581C),
            child: const Text('Transformers: Ege of Extinction'),
          ),
        ),
      );
  }

  Widget _expantionListView() {
    final expList = List.generate(8, (i) => "Header Index ${i + 1}");
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemBuilder: (context, index) => ExpansionTile(
          leading: Icon(
            Icons.star_border,
            color: Theme.of(context).accentColor,
          ),
          title: Text(expList[index]),
          children: expList
              .map((val) => ListTile(
                    title: Text(val),
                  ))
              .toList(),
        ),
        itemCount: 5,
      ),
    );
  }

  Widget _listView() {
    List magicList = List.generate(40, (ind) => "List index ${ind + 1}");
    return Align(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "Data: ${magicList[index]}",
            ),
            leading: CircleAvatar(
              child: Text("$index"),
              backgroundColor: Theme.of(context).accentColor,
            ),
          );
        },
        itemCount: magicList.length,
        padding: const EdgeInsets.all(10.0),
      ),
    );
  }

  Widget _theContainer() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 100.0,
            width: double.maxFinite,
            child: Slider(
              activeColor: Colors.red,
              value: sz,
              onChanged: (size) {
                setState(() {
                  sz = size;
                });
              },
              label: "$sz",
              min: 0.0,
              max: 300.0,
              inactiveColor: Colors.grey,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            width: sz,
            height: sz,
            color: Colors.red,
          )
        ],
      ),
    );
  }

  Widget _staggredGridView() {
    List imgUrls = [
      "https://images.pexels.com/photos/264146/pexels-photo-264146.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=250",
      "https://images.pexels.com/photos/163443/war-desert-guns-gunshow-163443.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=250",
      "https://images.pexels.com/photos/89112/pexels-photo-89112.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=250",
      "https://images.pexels.com/photos/3706650/pexels-photo-3706650.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=250",
      "https://images.pexels.com/photos/40753/military-raptor-jet-f-22-airplane-40753.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=250",
      "https://images.pexels.com/photos/2802368/pexels-photo-2802368.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=250",
      "https://images.pexels.com/photos/78783/submachine-gun-rifle-automatic-weapon-weapon-78783.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=250",
      "https://images.pexels.com/photos/3706670/pexels-photo-3706670.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=250",
    ];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Image.network(
            imgUrls[index],
            fit: BoxFit.fill,
          );
        },
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        reverse: true,
      ),
    );
  }

  // Its optional
  Widget _backdrop() {
    return BackdropScaffold(
      title: Text("BD login"),
      headerHeight: 50.0,
      frontLayerBorderRadius: BorderRadius.circular(10.0),
      backLayer: Center(
        child: Text("I am back cover"),
      ),
      frontLayer: Center(
        child: Text("I am front cover"),
      ),
    );
  }

  Widget _animBuilder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: _controller,
            child: Image(
              image: AssetImage("images/cross.png"),
            ),
            builder: (context, childWidget) {
              return Transform.rotate(
                angle: _controller.value * 2.0 * math.pi,
                child: childWidget,
              );
            },
          ),
          Container(
            child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.0, end: initValue),
                duration: Duration(seconds: 1),
                builder: (BuildContext context, double size, Widget child) {
                  return IconButton(
                    color: Colors.blue,
                    icon: child,
                    tooltip: "click me to see MaGiC",
                    iconSize: initValue,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      //print("onPressed called");
                      setState(() {
                        //print("onPressed setState before: $initValue");
                        initValue = initValue == 24.0 ? 48.0 : 24.0;
                        //print("onPressed setState after: $initValue");
                      });
                    },
                  );
                },
                child: Icon(
                  Icons.tag_faces,
                )),
          )
        ],
      ),
    );
  }

  Widget _rowVsColumn() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 1, fit: FlexFit.tight, child: _rowColumnControls()),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              child: isRow ? _row() : _column(),
            ),
          )
        ],
      ),
    );
  }

  Row _row() {
    return Row(
      mainAxisAlignment: mainAxisAlisgn,
      children: _rcChildren(),
    );
  }

  Column _column() {
    return Column(
      mainAxisAlignment: mainAxisAlisgn,
      children: _rcChildren(),
    );
  }

  List<Widget> _rcChildren() {
    return [
      Icon(Icons.tag_faces),
      Text("Smiley"),
      Icon(Icons.star),
      Text("Star")
    ];
  }

  Widget _rowColumnControls() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  setState(() {
                    isRow = true;
                  });
                },
                child: Text("Row"),
                color: isRow?pressedColor:Colors.transparent,
              ),
              RaisedButton(
                onPressed: (){
                  setState(() {
                    isRow = false;
                  });
                },
                child: Text("Column"),
                color: isRow?Colors.transparent:pressedColor,
              )
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  setState(() {
                    _controlListener(MainAxisAlignment.spaceEvenly);
                  });
                },
                child: Text(
                  "SpaceEvenly",
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              RaisedButton(
                onPressed: (){
                  setState(() {
                    _controlListener(MainAxisAlignment.center);
                  });
                },
                child: Text(
                  "Center",
                  style: TextStyle(fontSize: 12.0),
                ),
                highlightElevation: 2.0,
              ),
              RaisedButton(
                onPressed: (){
                  setState(() {
                    _controlListener(MainAxisAlignment.spaceBetween);
                  });
                },
                child: Text(
                  "SapceBetween",
                  style: TextStyle(fontSize: 12.0),
                ),
                highlightElevation: 2.0,
              ),
              RaisedButton(
                onPressed: (){
                  setState(() {
                    _controlListener(MainAxisAlignment.end);
                  });
                },
                child: Text(
                  "End",
                  style: TextStyle(fontSize: 12.0),
                ),
                highlightElevation: 2.0,
              ),
              RaisedButton(
                onPressed: (){
                  setState(() {
                    _controlListener(MainAxisAlignment.spaceAround);
                  });
                },
                child: Text(
                  "Space Around",
                  style: TextStyle(fontSize: 12.0),
                ),
                highlightElevation: 2.0,
              ),
              RaisedButton(
                onPressed: (){
                  setState(() {
                    _controlListener(MainAxisAlignment.start);
                  });
                },
                child: Text(
                  "Start",
                  style: TextStyle(fontSize: 12.0),
                ),
                highlightElevation: 2.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _controlListener(MainAxisAlignment alignment){
    mainAxisAlisgn = alignment;
  }
}