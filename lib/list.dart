import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class List extends StatefulWidget {
  const List({Key? key}) : super(key: key);
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: 200.0,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            buildCard(),
            SizedBox(width: 60.0),
            buildCard(),
            SizedBox(width: 60.0),
            buildCard(),
            SizedBox(width: 60.0),
            buildCard(),
            SizedBox(width: 60.0),
          ]),
        ),
      ),
    );
  }

  Widget buildCard() => Container(width: 200.0, height: 200.0, color: Colors.red, child: Image.asset('images/flower.jpg'));
}