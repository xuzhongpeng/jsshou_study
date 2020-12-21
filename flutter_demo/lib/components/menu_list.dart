import 'package:flutter/material.dart';

class MenuList extends StatefulWidget {
  final Map<String, WidgetBuilder> routes;
  MenuList({this.routes});
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          ...widget.routes.keys.map((route) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: widget.routes[route]));
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.grey[500]))),
                child: Center(
                  child: Text(route),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
