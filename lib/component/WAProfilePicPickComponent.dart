import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;

class PickProfilePictureComponenet extends StatefulWidget {
  const PickProfilePictureComponenet({Key? key}) : super(key: key);

  @override
  State<PickProfilePictureComponenet> createState() =>
      _PickProfilePictureComponenetState();
}

class _PickProfilePictureComponenetState
    extends State<PickProfilePictureComponenet> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print('No image selected');
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });

    var stream = new http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();

    var uri = Uri.parse('https://api.imgur.com/3/upload');

    var request = new http.MultipartRequest('POST', uri);

    var multiport = new http.MultipartFile('data', stream, length);

    request.files.add(multiport);

    var response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        showSpinner = false;
      });
      print('Image Uploaded');
    } else {
      setState(() {
        showSpinner = false;
      });
      print(response.statusCode);
      print('failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                child: image == null
                    ? Center(
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 172, 172, 172),
                          radius: 40,
                          child: const Icon(Icons.person_outline),
                        ),
                      )
                    
                    : Center(
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 172, 172, 172),
                          radius: 40,
                          child: Image.file(
                            File(image!.path).absolute,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
           
          ],
        ));
  }
}
