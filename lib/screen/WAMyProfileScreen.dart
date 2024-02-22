import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/screen/WAEditProfileScreen.dart';
import 'package:wallet_app/screen/WAInformationUpdateScreen.dart';
import 'package:wallet_app/utils/WAColors.dart';
import 'package:wallet_app/utils/WAWidgets.dart';


import '../main.dart';
import '../model/cardDetailsModel.dart';
import 'WAHelpScreen.dart';
import 'WALinkBankAcountScreen.dart';
import 'WALinkCardScreen.dart';
import 'WALoginScreen.dart';
import 'WAReferScreen.dart';
import 'WARelationShipManagerScreen.dart';

class WAMyProfileScreen extends StatefulWidget {
  // WAMyProfileScreen({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;
  static String tag = '/WAMyProfileScreen';

  @override
  WAMyProfileScreenState createState() => WAMyProfileScreenState(/*data: data*/);
}

class WAMyProfileScreenState extends State<WAMyProfileScreen> {
  // WAMyProfileScreenState({
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
          title: Text('My Profile',
              style: boldTextStyle(color: Colors.black, size: 20)),
          centerTitle: true,
          automaticallyImplyLeading: false,
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
                waCommonCachedNetworkImage(
                  "https://th.bing.com/th/id/OIG.zkpBEO0HK7kb.Qf5phAN?w=173&h=173&c=6&r=0&o=5&pid=ImgGn",
                
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                ).cornerRadiusWithClipRRect(60),
                16.height,
                Text('Ali', style: boldTextStyle()),
                //Text('ali@omaemirates.com', style: secondaryTextStyle()),
                16.height,
                SettingItemWidget(
                    title: 'Edit Profile',
                    decoration: boxDecorationRoundedWithShadow(12,
                        backgroundColor: context.cardColor),
                    trailing:
                        Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      WAEditProfileScreen(
                        /*isEditProfile: true,
                        data: data,*/
                      ).launch(context);
                    }),
                5.height,
                //16.height,
                SettingItemWidget(
                    title: 'Manage Wallet',
                    decoration: boxDecorationRoundedWithShadow(12,
                        backgroundColor: context.cardColor),
                    trailing:
                        Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      //
                    }),
                5.height,
                SettingItemWidget(
                    title: 'Link Bank Account',
                    decoration: boxDecorationRoundedWithShadow(12,
                        backgroundColor: context.cardColor),
                    trailing:
                        Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      // WAEditProfileScreen(
                      //   isEditProfile: true,
                      //   data: data,
                      // ).launch(context);
                      WALinkBankAcScreen(
                        /*data: data,*/
                      ).launch(context);
                    }),
                5.height,
                
                SettingItemWidget(
                    title: 'Link Card',
                    decoration: boxDecorationRoundedWithShadow(12,
                        backgroundColor: context.cardColor),
                    trailing: Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      // WAEditProfileScreen(
                      //   isEditProfile: true,
                      //   data: data,
                      // ).launch(context);
                      WALinkCardScreen(/*data: data,*/).launch(context);
                    }),
                    5.height,
                SettingItemWidget(
                    title: 'Dark Mode',
                    decoration: boxDecorationRoundedWithShadow(12,
                        backgroundColor: context.cardColor),
                    trailing: Switch(
                      value: appStore.isDarkModeOn,
                      activeColor: appColorPrimary,
                      onChanged: (s) {
                        appStore.toggleDarkMode(value: s);
                      },
                    ),
                    onTap: () {
                      //
                    }),

                5.height,
                //16.height,
                SettingItemWidget(
                    title: 'Relationship Managers',
                    decoration: boxDecorationRoundedWithShadow(12,
                        backgroundColor: context.cardColor),
                    trailing:
                        Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () async {
                      //print("hello World");
                      //WALoginScreen(/*data: data,*/).launch(context);
                      //WAReferToFriendScreen().launch(context);
                      RelationShipManagerScreen().launch(context);
                    }),
                5.height,
                //16.height,
                //16.height,
                SettingItemWidget(
                    title: 'Refer To Your Friends',
                    decoration: boxDecorationRoundedWithShadow(12,
                        backgroundColor: context.cardColor),
                    trailing:
                        Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () async {
                      print("hello World");
                      //WALoginScreen(/*data: data,*/).launch(context);
                      WAReferToFriendScreen().launch(context);
                    }),
                5.height,
                //16.height,
                SettingItemWidget(
                    title: 'Information Update',
                    decoration: boxDecorationRoundedWithShadow(12,
                        backgroundColor: context.cardColor),
                    trailing: Row(
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
                                child: Image(
                                  image: AssetImage(
                                      "images/mobile_banking/Screenshot_2023-03-10_083840-removebg-preview (1).png"),
                                  height: 20,
                                  width: 20,
                                ),
                              );
                            }),
                        Icon(Icons.arrow_right, color: grey.withOpacity(0.5))
                      ],
                    ),
                    onTap: () async {
                      print("hello World");
                      //WALoginScreen(/*data: data,*/).launch(context);
                      //WAReferToFriendScreen().launch(context);
                      InformationUpdateScreen(/*data: data*/).launch(context);
                    }),
                5.height,
                //16.height,
                SettingItemWidget(
                    title: 'Help',
                    decoration: boxDecorationRoundedWithShadow(12,
                        backgroundColor: context.cardColor),
                    trailing:
                        Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () async {
                      WAHelpScreen().launch(context);
                      // await SessionManager().destroy();
                      // WALoginScreen(/*data: data,*/).launch(context);
                    }),
                5.height,
                //16.height,
                SettingItemWidget(
                    title: 'Log Out',
                    decoration: boxDecorationRoundedWithShadow(12,
                        backgroundColor: context.cardColor),
                    trailing:
                        Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () async {
                      await SessionManager().destroy();
                      WALoginScreen(/*data: data,*/).launch(context);
                    }),
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
