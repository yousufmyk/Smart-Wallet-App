import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/screen/WAAddressUpdateScreen.dart';
import 'package:wallet_app/screen/WAUploadEmiratesIdScreen.dart';
import 'package:wallet_app/screen/WAUploadKYCScreen.dart';


import '../main.dart';
import '../model/cardDetailsModel.dart';
import 'WALoginScreen.dart';
import 'WAReferScreen.dart';

class InformationUpdateScreen extends StatefulWidget {
  // InformationUpdateScreen({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;
  static String tag = '/InformationUpdateScreen';

  @override
  InformationUpdateScreenState createState() =>
      InformationUpdateScreenState(/*data: data*/);
}

class InformationUpdateScreenState extends State<InformationUpdateScreen> {
  // InformationUpdateScreenState({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;
   bool status = false;

  _onChanged() async {
    bool user = await SessionManager().get("emiratesExpires");
    if (user == true) {
      setState(() {
        status = true;
        // print("hello");
        // print(user.toString());
      });
    } else {
      setState(() {
        status = false;
      });
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
          title: Text('Information Update',
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
          //  color: context.cardColor,

          height: context.height(),
          width: context.width(),
          padding: EdgeInsets.only(top: 60),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/mobile_banking/wa_bg.jpg'),
            fit: BoxFit.cover,
          )),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                16.height,
                SettingItemWidget(
                    title: 'Kyc Update',
                    decoration: boxDecorationRoundedWithShadow(12,
                        backgroundColor: context.cardColor),
                    trailing:
                        Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () async {
                      print("hello World");
                      //WALoginScreen(/*data: data,*/).launch(context);
                      //WAReferToFriendScreen().launch(context);
                      WAKYCuploadScreen().launch(context);
                    }),

                16.height,
                SettingItemWidget(
                    title: 'Emirates Id Update',
                    decoration: boxDecorationRoundedWithShadow(12,
                        backgroundColor: context.cardColor),
                    trailing:
                        Row(
                      children: [
                        FutureBuilder(
                            future: _onChanged(),
                            builder: (context, snapshot) {
                              return Visibility(
                                maintainSize: false,
                                maintainAnimation: true,
                                maintainState: true,
                                visible: status,
                                // child: Icon(
                                //   Icons.circle,
                                //   color: Colors.red,
                                //   size: 10,
                                // ),
                                child: Image(image: AssetImage("images/mobile_banking/Screenshot_2023-03-10_083840-removebg-preview (1).png"),height: 20,width: 20,),
                              );
                            }),
                        Icon(Icons.arrow_right, color: grey.withOpacity(0.5))
                      ],
                    ),
                    onTap: () async {
                      print("hello World");
                      //WALoginScreen(/*data: data,*/).launch(context);
                      //WAReferToFriendScreen().launch(context);
                      UploadEmiratesIdScreen().launch(context);
                    }),
                16.height,
                SettingItemWidget(
                    title: 'Address Update',
                    decoration: boxDecorationRoundedWithShadow(12,
                        backgroundColor: context.cardColor),
                    trailing:
                        Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () async {
                      print("hello World");
                      //WALoginScreen(/*data: data,*/).launch(context);
                      //WAReferToFriendScreen().launch(context);
                      AddressUpdateScreen().launch(context);
                    }),
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
