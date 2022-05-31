import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kua_app_01/registration.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  // ignore: annotate_overrides
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: title,
      home: Scaffold(
        appBar: AppBar(
                 actions: [
        IconButton(icon: const Icon(Icons.logout), onPressed: ()async{
          await FirebaseAuth.instance.signOut();
           Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) =>const Registration()),(route) => false);
        })

       ],
        ),
        backgroundColor: Colors.black,
        body: ListView(children: [
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              // ignore: prefer_const_constructors
              child: Text(
                "Hello",
                style: TextStyle(
                  fontFamily: 'WaterBrush',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Continue Watching",
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  //letterSpacing: 1.0,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Card(
                  color: Colors.grey,
                  shadowColor: Colors.red,
                  child: Image.asset('images/flower.jpg', height: 100.0, width: 160),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Card(
                  //width: 160.0,
                  color: Colors.grey,

                  child: Image.asset('images/flower.jpg', height: 100.0, width: 160),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Card(
                  //width: 160.0,
                  color: Colors.grey,
                  child: Image.asset('images/flower.jpg', height: 100.0, width: 160),
                ),
                Card(
                  color: Colors.grey,
                  child: Image.asset('images/flower.jpg', height: 100.0, width: 160),
                ),
                Card(
                  color: Colors.grey,
                  child: Image.asset('images/flower.jpg', height: 100.0, width: 160),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Popular Classes",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  //letterSpacing: 1.0,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 160.0,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: 160.0,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: 160.0,
                  color: Colors.grey,
                ),
                Container(
                  width: 160.0,
                  color: Colors.grey,
                ),
                Container(
                  width: 160.0,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Instructors",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  //letterSpacing: 1.0,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 160.0,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: 160.0,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: 160.0,
                  color: Colors.grey,
                ),
                Container(
                  width: 160.0,
                  color: Colors.grey,
                ),
                Container(
                  width: 160.0,
                  color: Colors.grey,
                ),
              ],
            ),
          )
        ]),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Colors.orange,
              ),
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.search,
                color: Colors.orange,
              ),
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.account_circle,
                color: Colors.orange,
              ),
              icon: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.orange,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}