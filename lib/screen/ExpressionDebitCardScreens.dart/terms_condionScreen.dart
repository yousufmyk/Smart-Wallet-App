import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:http/http.dart' as http;

// import '../../component/WAAcceptT&CcheckBoxComponent.dart';
import '../../main.dart';

class TermsAndConditiionScreen extends StatefulWidget {
  static String tag = '/WANotificationScreen';

  @override
  TermsAndConditiionScreenState createState() =>
      TermsAndConditiionScreenState();
}

class TermsAndConditiionScreenState extends State<TermsAndConditiionScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void dispose() {
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
          title: Text('Expression Debit/Credit card',
              style: boldTextStyle(color: Colors.black, size: 20)),
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
            height: context.height(),
            width: context.width(),
            padding: EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In auctor at purus sit amet laoreet. Vivamus id urna arcu. Aenean ac quam finibus, volutpat dolor sed, porttitor orci. Vestibulum volutpat, nibh et rhoncus ultrices, mi ligula blandit lorem, id ullamcorper nisi dolor id dolor. Aenean dapibus pulvinar facilisis."),
                10.height,
                Text(
                    "Nullam quis orci vehicula, tincidunt elit eget, vulputate quam. Phasellus eget aliquet justo, ac mollis tellus."),
                10.height,
                Container(
                  width: context.width(),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Image.asset(
                              "images/mobile_banking/Capture8-removebg-preview (1).png",)),
                      Expanded(
                          child: Image.asset(
                              "images/mobile_banking/Capture6-removebg-preview (1).png")),
                    ],
                  ),
                ),
                // WATandCcomponent()
              ],
            )).paddingAll(0),
      ),
    );
  }
}
