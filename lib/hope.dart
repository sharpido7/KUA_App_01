import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class Hope extends StatefulWidget {
  const Hope({Key? key}) : super(key: key);
  _HopeState createState() => _HopeState();
}

class _HopeState extends State<Hope> {
  TextEditingController author = new TextEditingController();
  TextEditingController category = new TextEditingController();
  TextEditingController title = new TextEditingController();
  TextEditingController sampledata1 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.all(40.0),
          child: Center(
            child: Column(children: [
              TextFormField(
                  controller: author,
                  decoration: InputDecoration(
                    hintText: 'Author',
                  )),
              TextFormField(controller: category, decoration: InputDecoration(hintText: 'Category')),
              TextFormField(controller: title, decoration: InputDecoration(hintText: 'title')),
              TextFormField(
                controller: sampledata1,
                decoration: InputDecoration(
                  fillColor: Colors.black.withOpacity(0.6),
                  filled: true,
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(8.0),
                    ),
                    borderSide: new BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              //TextFormField(controller: sampledata1, decoration: InputDecoration(hintText: 'sample data')),
              FlatButton(
                onPressed: () {
                  Map<String, dynamic> data = {
                    "author": author.text,
                    "category": category.text,
                    "title": title.text,
                  };
                  FirebaseFirestore.instance.collection('Course').add(data);
                },
                child: Text('Submit'),
                color: Colors.orange,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
