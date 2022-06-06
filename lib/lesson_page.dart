import 'package:flutter/material.dart';
import 'chewie_list_item.dart';
import 'package:video_player/video_player.dart';
//import 'package:url_launcher/url_launcher.dart';

class Coursepage extends StatelessWidget {
  Widget theTiles(String title, String sub, IconData icon) {
    return Column(
      children: [
        ListTile(
            trailing: Icon(icon, color: Color.fromARGB(255, 241, 153, 55)),
            focusColor: Color.fromARGB(255, 241, 153, 55),
            title: Text(title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)),
            subtitle: Text(sub, style: TextStyle(fontSize: 20.0, color: Colors.white)),
            tileColor: Color.fromARGB(255, 36, 36, 36),
            onTap: () {
              final Uri _emailLaunchUri = Uri(
                // scheme: thescheme,
                path: sub,
              );

              // launch(_emailLaunchUri.toString());
            }),
        Container(height: 5.0, color: Colors.black)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Course'),
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 89, 89, 89),
                    Color.fromARGB(255, 89, 89, 89)
                  ],
                )),
                padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 380,
                            width: 355,
                            child: ChewieListItem(
                              videoPlayerController: VideoPlayerController.asset(
                                'videos/jokate.mp4',
                              ),
                              looping: true,
                            ),
                          ),
                        ),
                        /*CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.play_arrow,
                            color: Color.fromARGB(255, 89, 89, 89),
                          ),
                          radius: 14.0,
                        ),
                        */
                      ],
                    ),
                  ],
                ),
              ),

              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Expanded(
                  child: Container(padding: EdgeInsets.all(20), color: Colors.black, child: Center(child: Text('Jockate Mwangelo', style: TextStyle(fontSize: 20.0, color: Colors.white)))),
                )
              ]),

              //Title of ther course
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Expanded(
                  child: Container(padding: EdgeInsets.all(20), color: Colors.black, child: Center(child: Text('LEADERSHIP', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)))),
                )
              ]),
              Container(
                color: Colors.black,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.black,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 241, 153, 55)),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'PLAY LESSON 1',
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.bookmarks,
                    color: Color.fromARGB(255, 241, 153, 55),
                  )
                ]),
              ),
              Container(
                color: Color.fromRGBO(0, 0, 0, 1),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(
                      child: Text('5 Lessons', style: TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 241, 153, 55))),
                    ),
                    Text('1h 15m', style: TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 241, 153, 55)))
                  ]),
                ),
              ),
              theTiles('1.What is Leadrship', '2:09', Icons.done),
              theTiles('2.My Story', '1:00', Icons.done),
              theTiles('3.Passion', '2:09', Icons.done),
              theTiles('4.The Passion', '2:09', Icons.done),
              theTiles('6.The whole Story', '2:09', Icons.file_download),
            ]),
          )),
    );
  }
}
