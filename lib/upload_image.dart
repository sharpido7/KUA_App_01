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
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color(0xffeef444c);
  String profilePicLink = "";

  void pickUploadProfilePic() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
      imageQuality: 90,
    );

    Reference ref = FirebaseStorage.instance.ref().child("profilepic.jpg");

    await ref.putFile(File(image!.path));

    ref.getDownloadURL().then((value) async {
      setState(() {
        profilePicLink = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                pickUploadProfilePic();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 80, bottom: 24),
                height: 120,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: primary,
                ),
                child: Center(
                  child: profilePicLink == " "
                      ? const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 80,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(profilePicLink),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
