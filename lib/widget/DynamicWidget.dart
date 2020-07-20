import 'package:flutter/material.dart';

class DynamicWidget extends StatefulWidget {
  final index;
  final title;
  DynamicWidget(this.index, this.title);

  @override
  _DynamicWidgetState createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  var sz = 300.0;
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: widget?.title,
        theme: ThemeData(
            primaryColor: Colors.deepOrange,
            accentColor: Colors.deepOrangeAccent
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(widget?.title),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: ()=> Navigator.of(context).pop(),
            ),
          ),
          body: _getIndexedWidget(widget.index),
        ),
      );
  }

  Widget _getIndexedWidget(int i){
    switch(i){
      case 1: return _expantionListView();
      case 2: return _listView();
      case 3: return _theContainer();
    }
    return null;
  }

  Widget _expantionListView(){
    final expList = List.generate(8, (i)=> "Header Index ${i+1}");
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemBuilder: (context, index)=> ExpansionTile(
          leading: Icon(Icons.star_border, color: Theme.of(context).accentColor,),
          title: Text(expList[index]),
          children: expList.map((val)=> ListTile(
            title: Text(val),
          )).toList(),
        ),
        itemCount: 5,
      ),
    );
  }

  Widget _listView(){
    List magicList = List.generate(40, (ind)=> "List index ${ind+1}");
    return Align(
      child: ListView.builder(
        itemBuilder: (context, index){
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

  Widget _theContainer(){
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
              onChanged: (size){
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

  Widget _staggredGridView(){
//    return
  }
}