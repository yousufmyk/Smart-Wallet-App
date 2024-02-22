import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:nb_utils/nb_utils.dart';


import '../model/cardDetailsModel.dart';
import 'WADashboardScreen.dart';
import 'WALoginScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WALogInLoadingScreen extends StatefulWidget {
  static String tag = '/WASplashScreen';

  @override
  WALogInLoadingScreenState createState() => WALogInLoadingScreenState(/*data:data*/);
}

class WALogInLoadingScreenState extends State<WALogInLoadingScreen> {
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
    await Future.delayed(Duration(seconds: 8));
    if (mounted) finish(context);
    WADashboardScreen(/*data: data*/).launch(context);
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
        body: Center(
          child: GifView.asset(
            "images/mobile_banking/animation_500_lis11ulj.gif",
            height: 250,
            width: 250,
            frameRate: 60,
            progress: Container(
              height: 250,
              width: 250,
            )
          ),
        ),
      ),
    );
  }
}
