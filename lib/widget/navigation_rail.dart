import 'package:flutter/material.dart';

class NavRail extends StatelessWidget {
  final _title = "Nav Rail Demo";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: DynamicNavLayout(_title),
    );
  }
}

class DynamicNavLayout extends StatefulWidget {
  final _title;
  DynamicNavLayout(this._title);

  @override
  _DynamicNavLayoutState createState() => _DynamicNavLayoutState();
}

class _DynamicNavLayoutState extends State<DynamicNavLayout> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index){
              setState(() {
                _selectedIndex = index;
              });
            },
            elevation: 4.0,
            backgroundColor: Colors.white,
            labelType: NavigationRailLabelType.selected,
            leading: CircleAvatar(
              backgroundColor: Colors.greenAccent,
              backgroundImage: AssetImage("images/me.JPG"),
            ),
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                label: Text('Star'),
                selectedIcon: Icon(Icons.star)
              ),
              NavigationRailDestination(
                icon: Icon(Icons.add_circle_outline),
                label: Text('Add'),
                selectedIcon: Icon(Icons.add_circle)
              ),
              NavigationRailDestination(
                  icon: Icon(Icons.airplanemode_inactive),
                  label: Text('On'),
                  selectedIcon: Icon(Icons.airplanemode_active)
              )
            ],
          ),
          VerticalDivider(thickness: 1.0, width: 1.0,),
          Expanded(
            child: Center(
              child: Text("Selected Index: $_selectedIndex"),
            ),
          )
        ],
      ),
    );
  }
}