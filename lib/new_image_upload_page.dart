import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class Up extends StatefulWidget {
  const Up({Key? key}) : super(key: key);
  _UpState createState() => _UpState();
}

class _UpState extends State<Up> {
  late String imageUrl;

  @override
  void initState() {
    imageUrl = "url";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Upload Image')),
            body: Column(
              children: [
                (imageUrl != null) ? Image.network(imageUrl) : Placeholder(fallbackHeight: 200.0, fallbackWidth: double.infinity),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  child: Text('Upload Image'),
                  color: Colors.orange,
                  onPressed: () => uploadImage(),
                )
              ],
            )));
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();

    PickedFile image;

    @override
    void initState() {
      imageUrl = "url";
      super.initState();
    }

    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = (await _picker.getImage(source: ImageSource.gallery))!;
      var file = File(image.path);
      var _file = File(image.path);

      if (image != null) {
        //Upload to Firebase
        var snapshot = await _storage.ref().child('folderName/imageName').putFile(file);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else if (kIsWeb) {
        final ImagePicker _picker = ImagePicker();
        XFile? image = await _picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          var f = await image.readAsBytes();
          setState(() {
            _file = File("a");
            var webImage = f;
          });
        } else {
          print("No web file selected");
        }
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  }
}
