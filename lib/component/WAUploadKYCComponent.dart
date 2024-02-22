import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../utils/WAColors.dart';
import 'WAIdCardComponent.dart';

class WAKycUploadComponent extends StatefulWidget {
  @override
  WAKycUploadComponentState createState() => WAKycUploadComponentState();
}

class WAKycUploadComponentState extends State<WAKycUploadComponent> {
  TextEditingController amountController =
      TextEditingController(text: "\u002450");

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
      // setState(() {
      //   showSpinner = false;
      // });
      print('Image Uploaded');
    } else {
      // setState(() {
      //   showSpinner = false;
      // });
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
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                  child: image == null
                      ? IdCardWidget(
                          imagePath: 'images/mobile_banking/card_back.png',
                          title: "Front",
                          iconSize: 1,
                          hasIcon: false,
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
                        )),
            ),
            10.height,
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: WAPrimaryColor,
                ),
                child: Text("upload"),
                // title: Strings.upload,
                onPressed: () {
                  getImage();
                },
              ),
            )
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                getImageTwo();
              },
              child: Container(
                  child: imageTwo == null
                      ? IdCardWidget(
                          imagePath: "images/mobile_banking/card_front.png",
                          title: "Back",
                          iconSize: 1,
                          hasIcon: false,
                        )
                      : Container(
                          child: Center(
                            child: Image.file(
                              File(imageTwo!.path).absolute,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
            ),
            //  10.width,
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: WAPrimaryColor,
                ),
                child: Text("upload"),
                onPressed: () {
                  getImageTwo();
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
