// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// Future<Widget> _getImage(BuildContext context, String imageName) async{
//   Image image;
//   await FireStorageService.loadImage(context, imageName).then((value)
//   {
//     image = Image.network(
//     value.toString(),
//     fit: BoxFit.scaleDown,
//     );

//   });

//   return image;

// }

// class FireStorageService extends ChangeNotifier{
//   FireStorageService();
//   static Future<dynamic> loadImage(BuildContext context, String Image) async{
//     return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
//   }
// }
//
//
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   double screenHeight = 0;
//   double screenWidth = 0;
//   Color primary = const Color(0xffeef444c);
//   String profilePicLink = "";

//   void pickUploadProfilePic() async {
//     final image = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//       maxHeight: 512,
//       maxWidth: 512,
//       imageQuality: 90,
//     );

//     Reference ref = FirebaseStorage.instance.ref().child("profilepic.jpg");

//     await ref.putFile(File(image!.path));

//     ref.getDownloadURL().then((value) async {
//       setState(() {
//         profilePicLink = value;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     screenHeight = MediaQuery.of(context).size.height;
//     screenWidth = MediaQuery.of(context).size.width;
//     return MaterialApp(
//       home: Scaffold(
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * 0.4,
//             child: Column(

//             children: [
//               GestureDetector(
//                 onTap: () {
//                   pickUploadProfilePic();
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.only(top: 80, bottom: 24),
//                   height: 120,
//                   width: 120,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: primary,
//                   ),
//                   child: Center(
//                     child: profilePicLink == " "
//                         ? const Icon(
//                             Icons.person,
//                             color: Colors.white,
//                             size: 80,
//                           )
//                         : ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: Image.network(profilePicLink),
//                           ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       ),
//     );
//   }
// }

// // class ProlifeScren extends StatefulWidget {
// //   const ProlifeScren({Key? key}) : super(key: key);
// //   _ProlifeScrenState createState() => _ProlifeScrenState();
// // }

// // class _ProlifeScrenState extends State<ProlifeScren> {

// //   double screenHeight = 0;
// //   double screenWidth = 0;
// //   Color primary = const Color(0xffeef444c);
// //   String profilePicLink = "";

// //   void pickUploadProfilePic() async {
// //     final image = await ImagePicker().pickImage(
// //       source: ImageSource.gallery,
// //       maxHeight: 512,
// //       maxWidth: 512,
// //       imageQuality: 90,
// //     );

// //     Reference ref = FirebaseStorage.instance.ref().child("profilepic.jpg");

// //     await ref.putFile(File(image!.path));

// //     ref.getDownloadURL().then((value) async {
// //       setState(() {
// //         profilePicLink = value;
// //       });
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     screenHeight = MediaQuery.of(context).size.height;
// //     screenWidth = MediaQuery.of(context).size.width;
// //     return Widget testWidget = new MediaQuery(
// //       data: new MediaQueryData(),
// //       child: new MaterialApp(home: new Scaffold(
// //         body: SingleChildScrollView(
// //           padding: const EdgeInsets.all(20),
// //           child: Column(
// //             children: [
// //               GestureDetector(
// //                 onTap: () {
// //                   pickUploadProfilePic();
// //                 },
// //                 child: Container(
// //                   margin: const EdgeInsets.only(top: 80, bottom: 24),
// //                   height: 120,
// //                   width: 120,
// //                   alignment: Alignment.center,
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(20),
// //                     color: primary,
// //                   ),
// //                   child: Center(
// //                     child: profilePicLink == " "
// //                         ? const Icon(
// //                             Icons.person,
// //                             color: Colors.white,
// //                             size: 80,
// //                           )
// //                         : ClipRRect(
// //                             borderRadius: BorderRadius.circular(20),
// //                             child: Image.network(profilePicLink),
// //                           ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       )
// //       ),
// //     );
// //   }
// // }
// /

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

class AddImage extends StatefulWidget {
  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  bool uploading = false;
  double val = 0;
  late CollectionReference imgRef;
  late firebase_storage.Reference ref;

  List<File> _image = [];
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Image'),
          actions: [
            FlatButton(
                onPressed: () {
                  setState(() {
                    uploading = true;
                  });
                  uploadFile().whenComplete(() => Navigator.of(context).pop());
                },
                child: Text(
                  'upload',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              child: GridView.builder(
                  itemCount: _image.length + 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return index == 0
                        ? Center(
                            child: IconButton(icon: Icon(Icons.add), onPressed: () => !uploading ? chooseImage() : null),
                          )
                        : Container(
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(image: DecorationImage(image: FileImage(_image[index - 1]), fit: BoxFit.cover)),
                          );
                  }),
            ),
            uploading
                ? Center(
                    child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(
                          'uploading...',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CircularProgressIndicator(
                        value: val,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      )
                    ],
                  ))
                : Container(),
          ],
        ));
  }

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile?.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    int i = 1;

    for (var img in _image) {
      setState(() {
        val = i / _image.length;
      });
      ref = firebase_storage.FirebaseStorage.instance.ref().child('images/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.add({
            'url': value
          });
          i++;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('imageURLs');
  }
}
