import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:kua_app_01/storage_service.dart';

class UploadPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Stateful Clicker Counter',
      theme: ThemeData(
        // Application theme data, you can set the colors for the application as
        // you want
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  final Storage storage = Storage();
  final Storage storage2 = Storage();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(' Uplaod to Cloud Storage')),
      body: Column(children: [
        Center(
          child: ElevatedButton(
            onPressed: () async {
              final results = await FilePicker.platform.pickFiles(
                allowMultiple: false,
                type: FileType.custom,
                allowedExtensions: [
                  'png',
                  'jpg'
                ],
              );

              if (results == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No File Selected'),
                  ),
                );
                return null;
              }

              //Added by me for web emulator
              if (results != null && results.files.isNotEmpty) {
                final fileBytes = results.files.first.bytes;
                // final fileName = results.files.first.name;

                // upload file

                // final path = results.files.single.path!;
                final fileName = results.files.single.name;
                //ByteData bytes = await rootBundle.load('assets/placeholder.png');
                //storage2.uploadFile(fileBytes, fileName).then((value) => print('Done'));
                await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes!);
              }

              final path = results.files.single.path!;
              final fileName = results.files.single.name;

              storage.uploadFile(path, fileName).then((value) => print('Done'));

              print(path);
              print(fileName);
            },
            child: Text('Upload File'),
          ),
        ),
        FutureBuilder(
          future: storage.listFiles(),
          builder: (BuildContext context, AsyncSnapshot<firebase_storage.ListResult> snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              return Container(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ElevatedButton(
                          onPressed: () {},
                          child: Text(snapshot.data!.items[index].name),
                        );
                      }));
            }
            if (snapshot.connectionState == ConnectionState.waiting || snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return Container(
              child: Text('Hi'),
            );
          },
        )
      ]),
    );
  }
}
