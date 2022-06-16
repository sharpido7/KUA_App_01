import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'list.dart';
import 'package:kua_app_01/lesson_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: HomeScreenWidget());
  }
}

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  int _selectedIndex = 0;

  /*void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  */

  void _onItemTapped(int index) {
    print(index);
    if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  CourseCard(first_name, last_name, course_title, image_name) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Coursepage())),
      child: Container(
        margin: EdgeInsets.all(8.0),
        height: 100.0,
        width: 133,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/$image_name.jpg'),
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            "$first_name",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "$last_name",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Divider(
            height: 5.0,
            thickness: 2.0,
            indent: 57,
            endIndent: 57,
            color: Colors.white,
          ),
          Text(
            "$course_title",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(children: [
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
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
              //new card
              CourseCard('JOKATE', 'MWANGELO', 'Leadership', 'jokate'),
              CourseCard('DIAMOND', 'PLATNUMZ', 'Music and Lyrics', 'diamond'),
              CourseCard('DIAMOND', 'PLATNUMZ', 'Music and Lyrics', 'diamond'),
              CourseCard('DIAMOND', 'PLATNUMZ', 'Music and Lyrics', 'diamond'),
              CourseCard('DIAMOND', 'PLATNUMZ', 'Music and Lyrics', 'diamond'),
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
              CourseCard('JOKATE', 'MWANGELO', 'Leadership', 'jokate'),
              CourseCard('DIAMOND', 'PLATNUMZ', 'Music and Lyrics', 'diamond'),
              CourseCard('DIAMOND', 'PLATNUMZ', 'Music and Lyrics', 'diamond'),
              CourseCard('DIAMOND', 'PLATNUMZ', 'Music and Lyrics', 'diamond'),
              CourseCard('DIAMOND', 'PLATNUMZ', 'Music and Lyrics', 'diamond'),
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
              CourseCard('JOKATE', 'MWANGELO', 'Leadership', 'jokate'),
              CourseCard('DIAMOND', 'PLATNUMZ', 'Music and Lyrics', 'diamond'),
              CourseCard('DIAMOND', 'PLATNUMZ', 'Music and Lyrics', 'diamond'),
              CourseCard('DIAMOND', 'PLATNUMZ', 'Music and Lyrics', 'diamond'),
              CourseCard('DIAMOND', 'PLATNUMZ', 'Music and Lyrics', 'diamond'),
            ],
          ),
        ),
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
    );
  }
}
