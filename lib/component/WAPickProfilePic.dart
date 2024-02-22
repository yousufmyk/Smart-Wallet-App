import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/WAColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../utils/WAColors.dart';
import 'WAIdCardComponent.dart';

class PickProfilePicWidget extends StatefulWidget {
  const PickProfilePicWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PickProfilePicWidget> createState() => _PickProfilePicWidgetState();
}

class _PickProfilePicWidgetState extends State<PickProfilePicWidget> {
  File? image;
  File? imageTwo;

  final _picker = ImagePicker();
  //bool showSpinner = false;

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

  Future getImageTwo() async {
    final pickedFileTwo =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFileTwo != null) {
      imageTwo = File(pickedFileTwo.path);
      setState(() {});
    } else {
      print('there is no image');
    }
  }

  Future<void> uploadImage() async {
    var stream = http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();

    var uri = Uri.parse('https://api.imgur.com/3/upload');

    var request = http.MultipartRequest('POST', uri);

    var multiport = http.MultipartFile('image', stream, length);

    request.files.add(multiport);

    var response = await request.send();

    if (response.statusCode == 200) {
    
      print('Image Uploaded');
    } else {
     
      print(response.statusCode);
      print('failed');
    }
    //this one is for second image apis
    var streamTwo = http.ByteStream(imageTwo!.openRead());

    streamTwo.cast();

    var lengthTwo = await imageTwo!.length();

    var uriTwo = Uri.parse('https://api.imgur.com/3/upload');

    var requestTwo = http.MultipartRequest('POST', uriTwo);

    var multiportTwo = http.MultipartFile('image', streamTwo, lengthTwo);

    requestTwo.files.add(multiportTwo);

    var responseTwo = await requestTwo.send();

    if (responseTwo.statusCode == 200) {
      print('Second Image Uploaded');
    } else {
      print('Second Image error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: image == null
            ? Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        color: WAPrimaryColor, shape: BoxShape.circle),
                    child: Icon(Icons.person, color: white, size: 60),
                  ),
                  Positioned(
                    bottom: 16,
                    child: GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        child: Icon(Icons.edit, color: Colors.white, size: 20),
                        decoration: BoxDecoration(
                            color: WAAccentColor, shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                child: Center(
                  child: Image.file(
                    File(image!.path).absolute,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ));
  }
}
