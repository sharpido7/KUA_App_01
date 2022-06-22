import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:kua_app_01/storage_service.dart';
import 'package:kua_app_01/try_retrieve.dart';
import 'dart:io';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final FirebaseFirestore fb = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: FutureBuilder(
            future: getImages(),
            builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(snapshot.data!.docs[index].data()["name"]),
                        leading: Image.network(snapshot.data!.docs[index].data()["url"], fit: BoxFit.fill),
                      );
                    });
              } else if (snapshot.connectionState == ConnectionState.none) {
                return Text("No data");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getImages() {
    return fb.collection("images").get();
  }
}
