import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/utils/WAWidgets.dart';


import '../component/WAAccoutProfileUpdatedailogComponent.dart';

import '../component/WAPickProfilePic.dart';
import '../main.dart';
import '../model/cardDetailsModel.dart';
import 'WAAddCreditionalScreen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WAReferToFriendScreen extends StatefulWidget {
  // final CreditCardModel data;
  // const WAReferToFriendScreen({
  //   Key? key,
  //   required this.data,
  //   this.isEditProfile

  // })  : assert(data != null),
  //       super(key: key);
  static String tag = '/WAReferToFriendScreen';
  //final isEditProfile;

  // WAEditProfileScreen({this.isEditProfile});

  @override
  WAReferToFriendScreenState createState() =>
      WAReferToFriendScreenState(/*data: data*/);
}

class WAReferToFriendScreenState extends State<WAReferToFriendScreen> {
  // WAEditProfileScreenState({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;
  var linkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Refer To Your Friend',
            style: boldTextStyle(color: Colors.black, size: 20),
          ),
          leading: Container(
            margin: EdgeInsets.all(8),
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: context.cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: Icon(Icons.arrow_back,
                color: appStore.isDarkModeOn ? white : black),
          ).onTap(() {
            finish(context);
          }),
          centerTitle: true,
          elevation: 0.0,
          //brightness: Brightness.dark,
        ),
        body: Container(
          height: context.mediaQuerySize.height,
          width: context.mediaQuerySize.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Column(
                children: [
                  waCommonCachedNetworkImage(
                      'https://media.istockphoto.com/id/1383606372/vector/refer-friend-concept.jpg?s=612x612&w=0&k=20&c=R5v00cPxO2S_V-ynBcUsfxafzEM3XDfFt2dHYHsMFVM=',
                      height: 280,
                      width: 280,
                      fit: BoxFit.cover),
                  //50.height,
                  10.height,
                  Text('Do it for your friends!',
                      style: boldTextStyle(size: 20),
                      textAlign: TextAlign.center),
                  //5.height,
                  Text('Refer & Earn. Share. Get Paid. Repeat!',
                      style: boldTextStyle(size: 20),
                      textAlign: TextAlign.center),
                  Text(
                      'Earn upto 100AED upon sucessful registration of your friends.',
                      /*style: boldTextStyle(size: 20),*/ textAlign:
                          TextAlign.center),
                  20.height,
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("http://bit.ly/3El4pI2"),
                        ElevatedButton(
                          onPressed: () {
                            Get.snackbar(
                              "Sucess",
                              "Copied to your clipboard !",
                              backgroundColor: Colors.greenAccent,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          },
                          child: Text("Copy",
                              style: TextStyle(color: Colors.white)),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                return Color.fromARGB(255, 81, 191,
                                    255); // Defer to the widget's default.
                              },
                            ),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                return Colors
                                    .greenAccent; // Defer to the widget's default.
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text('Copy this link and share it with your friends',
                      /*style: boldTextStyle(size: 20),*/ textAlign:
                          TextAlign.center),
                ],
              )
            ],
          ).paddingAll(30),
        ),
      ),
    );
  }
}
