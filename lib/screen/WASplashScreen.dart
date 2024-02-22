import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/screen/WAWalkThroughScreen.dart';
import 'package:wallet_app/utils/WAColors.dart';


import '../model/cardDetailsModel.dart';
import 'WALoginScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WASplashScreen extends StatefulWidget {
  static String tag = '/WASplashScreen';

  @override
  WASplashScreenState createState() => WASplashScreenState(/*data:data*/);
}

class WASplashScreenState extends State<WASplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(
        /*WAPrimaryColor,*/
        Colors.white,
        statusBarIconBrightness: Brightness.light);
    await Future.delayed(Duration(seconds: 5));
    if (mounted) finish(context);
    WAWalkThroughScreen(/*data: data*/).launch(context);
    // WAWalkThroughScreen(data: data,).launch(context);
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
        //backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'images/mobile_banking/wa_app_logo.png',
            //   color: Colors.white,
            //   fit: BoxFit.cover,
            //   height: 100,
            //   width: 100,
            // ).center(),
            SizedBox(
              height: 500,
              width: 500,
              child: GifView.asset(
                "images/mobile_banking/animation_300_liouyfeg.gif",
                //height: 300,
                //width: 500,
                frameRate: 30,
                progress: Container(
                  height: 500,
                  width: 500,
                )
              ),
            ),

            //16.height,

            // Text('Smart Banking App',
            //                 style: boldTextStyle(size: 40, color: WAPrimaryColor)),

            SizedBox(
              height: 150,
              width: 500,
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 40.0, fontFamily: 'Horizon', color: WAPrimaryColor),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('Smart Banking App'),
                    RotateAnimatedText('Build With Flutter'),
                    //RotateAnimatedText('DIFFERENT'),
                  ],
                  // onTap: () {
                  //   print("Tap Event");
                  // },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
