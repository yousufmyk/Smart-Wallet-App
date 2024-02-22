import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:nb_utils/nb_utils.dart';


import '../component/WAAccoutProfileUpdatedailogComponent.dart';

import '../component/WAPickProfilePic.dart';
import '../main.dart';
import '../model/cardDetailsModel.dart';
import 'WAAddCreditionalScreen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'WARelationShipManagerScreen.dart';

class WAHelpScreen extends StatefulWidget {
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
  WAHelpScreenState createState() => WAHelpScreenState(/*data: data*/);
}

class WAHelpScreenState extends State<WAHelpScreen> {
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
            'Help',
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
                  15.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Help Center",
                        style: boldTextStyle(color: Colors.black, size: 20),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.help_outline_outlined,
                            color: Colors.greenAccent,
                          ))
                    ],
                  ),
                  20.height,
                  Text("How Can We",
                      style: boldTextStyle(color: Colors.black, size: 30)),
                  5.height,
                  Text(
                    "Help You?",
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.greenAccent,
                        decorationThickness: 2),
                  ),
                  20.height,
                  Container(
                    //color: Colors.white,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20.0, // Soften the shaodw
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Start typing your search"),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search_rounded,
                              color: Colors.greenAccent,
                            ))
                      ],
                    ),
                  ),
                  30.height,
                  Text("Or choos an option below"),
                  10.height,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(253, 223, 223, 223),
                          blurRadius: 5.0, // Soften the shaodw
                          spreadRadius: 0.5,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    //color: Colors.greenAccent,
                    height: 70,
                    width: 250,
                    child: Row(
                      children: [
                        Icon(
                          Icons.manage_search_outlined,
                          color: Colors.greenAccent,
                          size: 35,
                        ),
                        9.width,
                        Text(
                          "Guide",
                          style: boldTextStyle(color: Colors.black, size: 20),
                        )
                      ],
                    ),
                  ),
                  10.height,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(253, 223, 223, 223),
                          blurRadius: 5.0, // Soften the shaodw
                          spreadRadius: 0.5,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    //color: Colors.greenAccent,
                    height: 70,
                    width: 250,
                    child: Row(
                      children: [
                        Icon(
                          Icons.chat_rounded,
                          color: Colors.greenAccent,
                          size: 35,
                        ),
                        9.width,
                        Text(
                          "FAQ",
                          style: boldTextStyle(color: Colors.black, size: 20),
                        )
                      ],
                    ),
                  ),
                  10.height,
                  GestureDetector(
                    onTap: () {
                      RelationShipManagerScreen().launch(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        //border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(253, 223, 223, 223),
                            blurRadius: 5.0, // Soften the shaodw
                            spreadRadius: 0.5,
                            offset: Offset(0.0, 0.0),
                          )
                        ],
                      ),
                      //color: Colors.greenAccent,
                      height: 70,
                      width: 250,
                      child: Row(
                        children: [
                          Icon(
                            Icons.group_outlined,
                            color: Colors.greenAccent,
                            size: 35,
                          ),
                          9.width,
                          Text(
                            "One On One support",
                            style: boldTextStyle(color: Colors.black, size: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  10.height,
                  Text("Getting Started",
                      style: boldTextStyle(color: Colors.black, size: 25)),
                  5.height,
                  Text("Lorem ipsum dolor sit amet, consectetur "),
                  Text("adipiscing elit. Sed non"),
                  Text("interdum dolor."),
                ],
              )
            ],
          ).paddingAll(30),
        ),
      ),
    );
  }
}
