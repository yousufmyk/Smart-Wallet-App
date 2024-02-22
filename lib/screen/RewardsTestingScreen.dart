import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:nb_utils/nb_utils.dart';

import 'package:wallet_app/screen/WACouponScreen.dart';
import 'package:wallet_app/screen/WARewardsTwoScreen.dart';

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
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';

class RewardTwoTestingScreen extends StatefulWidget {
  static String tag = '/RewardTwoTestingScreen';

  @override
  RewardTwoTestingScreenState createState() => RewardTwoTestingScreenState();
}

class RewardTwoTestingScreenState extends State<RewardTwoTestingScreen> {
  // List<WAVoucherModel> voucherList = waVouchersList();
  // StreamController<int> controller = StreamController<int>();
  // late ConfettiController _controllerCenter;
  // late ConfettiController _controllerCenterRight;
  // late ConfettiController _controllerCenterLeft;
  // late ConfettiController _controllerTopCenter;
  // late ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    super.initState();
    init();

    // _controllerCenter =
    //     ConfettiController(duration: const Duration(seconds: 10));
    // _controllerCenterRight =
    //     ConfettiController(duration: const Duration(seconds: 10));
    // _controllerCenterLeft =
    //     ConfettiController(duration: const Duration(seconds: 10));
    // _controllerTopCenter =
    //     ConfettiController(duration: const Duration(seconds: 10));
    // _controllerBottomCenter =
    //     ConfettiController(duration: const Duration(seconds: 10));
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
    // _controllerCenter.dispose();
    // _controllerCenterRight.dispose();
    // _controllerCenterLeft.dispose();
    // _controllerTopCenter.dispose();
    // _controllerBottomCenter.dispose();
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
    // ConfettiWidget(
    //   confettiController: _controllerCenter,
    //   blastDirectionality: BlastDirectionality
    //       .explosive, // don't specify a direction, blast randomly
    //   shouldLoop: true, // start again as soon as the animation is finished
    //   colors: const [
    //     Colors.green,
    //     Colors.blue,
    //     Colors.pink,
    //     Colors.orange,
    //     Colors.purple
    //   ], // manually specify the colors to be used
    //   createParticlePath: drawStar, // define a custom shape/path.
    // );
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.yellowAccent,
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
          body: SingleChildScrollView(
            child: Container(
                height: context.height(),
                width: context.width(),
                padding: EdgeInsets.only(top: 35),
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                    //     fit: BoxFit.cover)),
                    color: Colors.grey[200]),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: context.width(),
                        color: Colors.yellowAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              20.height,
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Welcome to",
                                    style: secondaryTextStyle(
                                        color: Colors.black, size: 15),
                                    textAlign: TextAlign.left,
                                  )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Oma Rewards",
                                      style: boldTextStyle(
                                          color: Colors.black, size: 20)),
                                  Container(
                                      child: Row(
                                    children: [
                                      Icon(Icons.av_timer_outlined),
                                      5.width,
                                      Icon(Icons.notifications_active_outlined)
                                    ],
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedOverflowBox(
                        size: const Size(100, 100),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Container(
                            height: 100,
                            width: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_outline_sharp,
                                              size: 30,
                                            ),
                                            2.width,
                                            Text("Points",
                                                style: boldTextStyle(
                                                    color: Colors.black,
                                                    size: 20))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("2,000",
                                          style: boldTextStyle(
                                              color: Colors.black, size: 20)),
                                      Text(
                                        "Equalsد.إ‎200",
                                        style: secondaryTextStyle(
                                            color: Colors.black, size: 12),
                                        textAlign: TextAlign.left,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        alignment: Alignment.center,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 120,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.money,
                                          ),
                                          Text(
                                            "Earn",
                                            style: boldTextStyle(
                                                color: Colors.black, size: 20),
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: IconButton(
                                      onPressed: () async {
                                        RewardTwoScreen().launch(context);
                                      },
                                      icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.yellowAccent),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 120,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.card_giftcard_rounded,
                                          ),
                                          Text(
                                            "Redeem",
                                            style: boldTextStyle(
                                                color: Colors.black, size: 20),
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: IconButton(
                                      onPressed: () async {
                                        WACouoponScreen().launch(context);
                                      },
                                      icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.yellowAccent),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.height,
                      Container(
                        height: 100,
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Icon(Icons.rotate_left_rounded),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Gold",
                                        style: boldTextStyle(
                                            color: Colors.black, size: 20),
                                        //textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        "(Level 5)",
                                        style: secondaryTextStyle(
                                            color: Colors.black, size: 12),
                                        //textAlign: TextAlign.left,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("1090 Points left for Gold Level"),
                                      new LinearPercentIndicator(
                                        width: 140.0,
                                        lineHeight: 14.0,
                                        percent: 0.7,
                                        center: Text(
                                          "60.0%",
                                          style: new TextStyle(fontSize: 12.0),
                                        ),
                                        trailing:
                                            Icon(Icons.card_giftcard_sharp),
                                        linearStrokeCap:
                                            LinearStrokeCap.roundAll,
                                        backgroundColor: Colors.grey[200],
                                        progressColor: Colors.yellowAccent,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios_rounded,
                                    color: Colors.yellowAccent),
                              ),
                            )
                          ],
                        ),
                      ),
                      20.height,
                      Container(
                          height: 250,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Refer Your Friends",
                                      style: boldTextStyle(
                                          color: Colors.black, size: 20)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.yellowAccent))
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.yellowAccent,
                                        size: 10,
                                      ),
                                      7.width,
                                      Text(
                                        "You'll get",
                                        style: secondaryTextStyle(
                                            color: Colors.black, size: 15),
                                      ),
                                      5.width,
                                      Text(
                                        "د.إ‎ 20Coupon",
                                        style: boldTextStyle(
                                            color: Colors.black, size: 17),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.yellowAccent,
                                        size: 10,
                                      ),
                                      7.width,
                                      Text(
                                        "They'll get",
                                        style: secondaryTextStyle(
                                            color: Colors.black, size: 15),
                                      ),
                                      5.width,
                                      Text(
                                        "Free Shopping Coupons",
                                        style: boldTextStyle(
                                            color: Colors.black, size: 17),
                                      )
                                    ],
                                  ),
                                  15.height,
                                  Container(
                                    height: 50,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: black),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("http://bit.ly/3El4pI2"),
                                        // ElevatedButton(
                                        //   onPressed: () {
                                        //     Get.snackbar(
                                        //       "Sucess",
                                        //       "Copied to your clipboard !",
                                        //       backgroundColor: Colors.greenAccent,
                                        //       snackPosition: SnackPosition.BOTTOM,
                                        //     );
                                        //   },
                                        //   child: Text("Copy",
                                        //       style:
                                        //           TextStyle(color: Colors.white)),
                                        //   style: ButtonStyle(
                                        //     backgroundColor: MaterialStateProperty
                                        //         .resolveWith<Color?>(
                                        //       (Set<MaterialState> states) {
                                        //         return Color.fromARGB(
                                        //             255,
                                        //             81,
                                        //             191,
                                        //             255); // Defer to the widget's default.
                                        //       },
                                        //     ),
                                        //     overlayColor: MaterialStateProperty
                                        //         .resolveWith<Color?>(
                                        //       (Set<MaterialState> states) {
                                        //         return Colors
                                        //             .greenAccent; // Defer to the widget's default.
                                        //       },
                                        //     ),
                                        //   ),
                                        // )
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0),
                                          child: GestureDetector(
                                            onTap: () async {
                                              // Get.snackbar(
                                              //   "Sucess",
                                              //   "Copied to your clipboard !",
                                              //   backgroundColor:
                                              //       Colors.yellowAccent,
                                              //   snackPosition:
                                              //       SnackPosition.BOTTOM,
                                              // );
                                              SocialShare.shareOptions(
                                                  "http://bit.ly/3El4pI2");
                                            },
                                            child: Container(
                                              height: context.height(),
                                              width: 60,
                                              color: Colors.yellowAccent,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.send_rounded,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  Text(
                                                    "Share",
                                                    style: boldTextStyle(
                                                        color: Colors.black,
                                                        size: 14),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  7.height,
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "You've Refferd 0 Friends",
                                      style: boldTextStyle(
                                          color: Colors.black, size: 15),
                                    ),
                                  )
                                ],
                              ),
                              10.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        SocialShare.copyToClipboard(
                                            text: "http://bit.ly/3El4pI2");
                                      },
                                      icon: Icon(Icons.facebook)),
                                  GestureDetector(
                                    child: Image(
                                      image: AssetImage(
                                          "images/mobile_banking/whatsapp.png"),
                                    ),
                                    onTap: () async {
                                      
                                      SocialShare.shareWhatsapp(
                                          "http://bit.ly/3El4pI2");
                                    },
                                  )
                                ],
                              )
                            ],
                          )),
                      20.height,
                      Container(
                          height: 150,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Daily Rewards",
                                      style: boldTextStyle(
                                          color: Colors.black, size: 20)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.yellowAccent))
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.yellowAccent,
                                        size: 10,
                                      ),
                                      7.width,
                                      Text(
                                        "On Daily د.إ‎ 1000 transaction",
                                        style: secondaryTextStyle(
                                            color: Colors.black, size: 15),
                                      ),
                                      5.width,
                                      Text(
                                        "د.إ‎ 200Coupon",
                                        style: boldTextStyle(
                                            color: Colors.black, size: 17),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.yellowAccent,
                                        size: 10,
                                      ),
                                      7.width,
                                      Text(
                                        "You'll get",
                                        style: secondaryTextStyle(
                                            color: Colors.black, size: 15),
                                      ),
                                      5.width,
                                      Text(
                                        "A Free Spin",
                                        style: boldTextStyle(
                                            color: Colors.black, size: 17),
                                      )
                                    ],
                                  ),
                                  15.height,
                                  // Container(
                                  //   height: 50,
                                  //   padding: EdgeInsets.all(5),
                                  //   decoration: BoxDecoration(
                                  //       border: Border.all(color: black),
                                  //       borderRadius:
                                  //           BorderRadius.circular(10)),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Text("http://bit.ly/3El4pI2"),
                                  //       // ElevatedButton(
                                  //       //   onPressed: () {
                                  //       //     Get.snackbar(
                                  //       //       "Sucess",
                                  //       //       "Copied to your clipboard !",
                                  //       //       backgroundColor: Colors.greenAccent,
                                  //       //       snackPosition: SnackPosition.BOTTOM,
                                  //       //     );
                                  //       //   },
                                  //       //   child: Text("Copy",
                                  //       //       style:
                                  //       //           TextStyle(color: Colors.white)),
                                  //       //   style: ButtonStyle(
                                  //       //     backgroundColor: MaterialStateProperty
                                  //       //         .resolveWith<Color?>(
                                  //       //       (Set<MaterialState> states) {
                                  //       //         return Color.fromARGB(
                                  //       //             255,
                                  //       //             81,
                                  //       //             191,
                                  //       //             255); // Defer to the widget's default.
                                  //       //       },
                                  //       //     ),
                                  //       //     overlayColor: MaterialStateProperty
                                  //       //         .resolveWith<Color?>(
                                  //       //       (Set<MaterialState> states) {
                                  //       //         return Colors
                                  //       //             .greenAccent; // Defer to the widget's default.
                                  //       //       },
                                  //       //     ),
                                  //       //   ),
                                  //       // )
                                  //       // Padding(
                                  //       //   padding: const EdgeInsets.only(
                                  //       //       left: 8.0, right: 8.0),
                                  //       //   child: GestureDetector(
                                  //       //     onTap: () async {
                                  //       //       // Get.snackbar(
                                  //       //       //   "Sucess",
                                  //       //       //   "Copied to your clipboard !",
                                  //       //       //   backgroundColor:
                                  //       //       //       Colors.yellowAccent,
                                  //       //       //   snackPosition:
                                  //       //       //       SnackPosition.BOTTOM,
                                  //       //       // );
                                  //       //       SocialShare.shareOptions(
                                  //       //           "Hello world");
                                  //       //     },
                                  //       //     child: Container(
                                  //       //       height: context.height(),
                                  //       //       width: 60,
                                  //       //       color: Colors.yellowAccent,
                                  //       //       child: Row(
                                  //       //         children: [
                                  //       //           Icon(
                                  //       //             Icons.send_rounded,
                                  //       //             color: Colors.black,
                                  //       //             size: 20,
                                  //       //           ),
                                  //       //           Text(
                                  //       //             "Share",
                                  //       //             style: boldTextStyle(
                                  //       //                 color: Colors.black,
                                  //       //                 size: 14),
                                  //       //           )
                                  //       //         ],
                                  //       //       ),
                                  //       //     ),
                                  //       //   ),
                                  //       // )
                                  //     ],
                                  //   ),
                                  // ),
                                  7.height,
                                  // Align(
                                  //   alignment: Alignment.centerLeft,
                                  //   child: Text(
                                  //     "You've Refferd 0 Friends",
                                  //     style: boldTextStyle(
                                  //         color: Colors.black, size: 15),
                                  //   ),
                                  // )
                                ],
                              ),
                              10.height,
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: [
                              //     IconButton(
                              //         onPressed: () async {
                              //           SocialShare.copyToClipboard(
                              //               text: "helloWorld");
                              //         },
                              //         icon: Icon(Icons.facebook)),
                              //     GestureDetector(
                              //       child: Image(
                              //         image: AssetImage(
                              //             "images/mobile_banking/whatsapp.png"),
                              //       ),
                              //       onTap: () async {
                              //         SocialShare.shareWhatsapp("Hello World");
                              //       },
                              //     )
                              //   ],
                              // )
                            ],
                          )),
                      20.height,
                      Container(
                          height: 150,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Monthly Rewards",
                                      style: boldTextStyle(
                                          color: Colors.black, size: 20)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.yellowAccent))
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.yellowAccent,
                                        size: 10,
                                      ),
                                      7.width,
                                      Text(
                                        "On د.إ‎ 100,0000 transaction",
                                        style: secondaryTextStyle(
                                            color: Colors.black, size: 15),
                                      ),
                                      5.width,
                                      Text(
                                        "د.إ‎ 2000Coupon",
                                        style: boldTextStyle(
                                            color: Colors.black, size: 17),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.yellowAccent,
                                        size: 10,
                                      ),
                                      7.width,
                                      Text(
                                        "You'll get",
                                        style: secondaryTextStyle(
                                            color: Colors.black, size: 15),
                                      ),
                                      5.width,
                                      Text(
                                        "A Free Spin",
                                        style: boldTextStyle(
                                            color: Colors.black, size: 17),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.yellowAccent,
                                        size: 10,
                                      ),
                                      7.width,
                                      Text(
                                        "Upon Reffering 10 Friends",
                                        style: secondaryTextStyle(
                                            color: Colors.black, size: 15),
                                      ),
                                      5.width,
                                      Text(
                                        "3 Free Spin",
                                        style: boldTextStyle(
                                            color: Colors.black, size: 17),
                                      )
                                    ],
                                  ),
                                  15.height,
                                  // Container(
                                  //   height: 50,
                                  //   padding: EdgeInsets.all(5),
                                  //   decoration: BoxDecoration(
                                  //       border: Border.all(color: black),
                                  //       borderRadius:
                                  //           BorderRadius.circular(10)),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Text("http://bit.ly/3El4pI2"),
                                  //       // ElevatedButton(
                                  //       //   onPressed: () {
                                  //       //     Get.snackbar(
                                  //       //       "Sucess",
                                  //       //       "Copied to your clipboard !",
                                  //       //       backgroundColor: Colors.greenAccent,
                                  //       //       snackPosition: SnackPosition.BOTTOM,
                                  //       //     );
                                  //       //   },
                                  //       //   child: Text("Copy",
                                  //       //       style:
                                  //       //           TextStyle(color: Colors.white)),
                                  //       //   style: ButtonStyle(
                                  //       //     backgroundColor: MaterialStateProperty
                                  //       //         .resolveWith<Color?>(
                                  //       //       (Set<MaterialState> states) {
                                  //       //         return Color.fromARGB(
                                  //       //             255,
                                  //       //             81,
                                  //       //             191,
                                  //       //             255); // Defer to the widget's default.
                                  //       //       },
                                  //       //     ),
                                  //       //     overlayColor: MaterialStateProperty
                                  //       //         .resolveWith<Color?>(
                                  //       //       (Set<MaterialState> states) {
                                  //       //         return Colors
                                  //       //             .greenAccent; // Defer to the widget's default.
                                  //       //       },
                                  //       //     ),
                                  //       //   ),
                                  //       // )
                                  //       // Padding(
                                  //       //   padding: const EdgeInsets.only(
                                  //       //       left: 8.0, right: 8.0),
                                  //       //   child: GestureDetector(
                                  //       //     onTap: () async {
                                  //       //       // Get.snackbar(
                                  //       //       //   "Sucess",
                                  //       //       //   "Copied to your clipboard !",
                                  //       //       //   backgroundColor:
                                  //       //       //       Colors.yellowAccent,
                                  //       //       //   snackPosition:
                                  //       //       //       SnackPosition.BOTTOM,
                                  //       //       // );
                                  //       //       SocialShare.shareOptions(
                                  //       //           "Hello world");
                                  //       //     },
                                  //       //     child: Container(
                                  //       //       height: context.height(),
                                  //       //       width: 60,
                                  //       //       color: Colors.yellowAccent,
                                  //       //       child: Row(
                                  //       //         children: [
                                  //       //           Icon(
                                  //       //             Icons.send_rounded,
                                  //       //             color: Colors.black,
                                  //       //             size: 20,
                                  //       //           ),
                                  //       //           Text(
                                  //       //             "Share",
                                  //       //             style: boldTextStyle(
                                  //       //                 color: Colors.black,
                                  //       //                 size: 14),
                                  //       //           )
                                  //       //         ],
                                  //       //       ),
                                  //       //     ),
                                  //       //   ),
                                  //       // )
                                  //     ],
                                  //   ),
                                  // ),
                                  7.height,
                                  // Align(
                                  //   alignment: Alignment.centerLeft,
                                  //   child: Text(
                                  //     "You've Refferd 0 Friends",
                                  //     style: boldTextStyle(
                                  //         color: Colors.black, size: 15),
                                  //   ),
                                  // )
                                ],
                              ),
                              20.height,
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: [
                              //     IconButton(
                              //         onPressed: () async {
                              //           SocialShare.copyToClipboard(
                              //               text: "helloWorld");
                              //         },
                              //         icon: Icon(Icons.facebook)),
                              //     GestureDetector(
                              //       child: Image(
                              //         image: AssetImage(
                              //             "images/mobile_banking/whatsapp.png"),
                              //       ),
                              //       onTap: () async {
                              //         SocialShare.shareWhatsapp("Hello World");
                              //       },
                              //     )
                              //   ],
                              // )
                            ],

                          )
                          ),
                    ],
                  ),
                )),
          )),
    );
  }
}

Text _display(String text) {
  return Text(
    text,
    style: const TextStyle(color: Colors.white, fontSize: 20),
  );
}
