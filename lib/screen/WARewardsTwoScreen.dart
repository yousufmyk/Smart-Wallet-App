import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/model/WalletAppModel.dart';
import 'package:wallet_app/utils/WADataGenerator.dart';


import '../component/WAClaimRewardDailog.dart';
import '../component/WAVoucherDailog.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class RewardTwoScreen extends StatefulWidget {
  static String tag = '/RewardTwoScreen';

  @override
  RewardTwoScreenState createState() => RewardTwoScreenState();
}

class RewardTwoScreenState extends State<RewardTwoScreen> {
  List<WAVoucherModel> voucherList = waVouchersList();
  StreamController<int> controller = StreamController<int>();
  late ConfettiController _controllerCenter;
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;
  late ConfettiController _controllerTopCenter;
  late ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    super.initState();
    init();

    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    _controllerTopCenter.dispose();
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    ConfettiWidget(
      confettiController: _controllerCenter,
      blastDirectionality: BlastDirectionality
          .explosive, // don't specify a direction, blast randomly
      shouldLoop: true, // start again as soon as the animation is finished
      colors: const [
        Colors.green,
        Colors.blue,
        Colors.pink,
        Colors.orange,
        Colors.purple
      ], // manually specify the colors to be used
      createParticlePath: drawStar, // define a custom shape/path.
    );
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Rewards',
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
              height: context.height(),
              width: context.width(),
              padding: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Expanded(
                    child: FortuneWheel(
                      selected: controller.stream,
                      items: [
                        FortuneItem(child: Text('200')),
                        FortuneItem(child: Text('400')),
                        FortuneItem(child: Text('600')),
                        FortuneItem(child: Text('800')),
                        FortuneItem(child: Text('1000')),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ConfettiWidget(
                      confettiController: _controllerCenter,
                      blastDirectionality: BlastDirectionality
                          .explosive, // don't specify a direction, blast randomly
                      shouldLoop:
                          true, // start again as soon as the animation is finished
                      colors: const [
                        Colors.green,
                        Colors.blue,
                        Colors.pink,
                        Colors.orange,
                        Colors.purple
                      ], // manually specify the colors to be used
                      createParticlePath:
                          drawStar, // define a custom shape/path.
                    ),
                  ),
                  Text("Spin the wheel to get your rewards", style: boldTextStyle(size: 22), textAlign: TextAlign.center),
                60.height,
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              return Color.fromARGB(255, 81, 191,
                                  255); // Defer to the widget's default.
                            },
                          ),
                        ),
                        onPressed: () {
                          _controllerCenter.play();
                          // WAClaimRewardDialog().launch(context);
                          showInDialog(context, builder: (context) {
                            return WAClaimRewardDialog();
                          });
                        },
                        child: _display('Claim')),
                  ).paddingAll(20),

                   
                ],
              ))),
    );
  }
}

Text _display(String text) {
  return Text(
    text,
    style: const TextStyle(color: Colors.white, fontSize: 20),
  );
}
