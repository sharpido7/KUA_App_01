import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:image_picker_web/image_picker_web.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    PickedFile image;
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted){
      //Select Image
     
      
      image = await _imagePicker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null){
        //Upload to Firebase
        var snapshot = await _firebaseStorage.ref()
        .child('images/imageName')
        .putFile(file).onComplete;
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
           imageUrl = downloadUrl;
        });
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }
class _ImageUploadState extends State<ImageUpload> {
  //String imageUrl;
  var imageUrl;

  @override
  Widget build(BuildContext context) {
    var imageUrl;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Upload Image',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2, 2),
                    spreadRadius: 2,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: (imageUrl != null) ? Image.network(imageUrl) : Image.network('https://i.imgur.com/sUFH1Aq.png'),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text("Upload Image", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              onPressed: () 
              {
                uploadImage();
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: BorderSide(color: Colors.blue)),
              elevation: 5.0,
              color: Colors.orange,
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              splashColor: Colors.grey,
            ),
          ],
        ),
      ),
    );

     


  }
}
