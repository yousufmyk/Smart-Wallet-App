import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../component/Coupons/CouponComponentFour.dart';
import '../component/Coupons/CouponComponentOne.dart';
import '../component/Coupons/CouponComponentThree.dart';
import '../component/Coupons/CouponComponentTwo.dart';
import '../component/Coupons/CouponConponentFive.dart';
import '../component/WAVoucherDailog.dart';
import '../main.dart';

class WACouoponScreen extends StatefulWidget {
  static String tag = '/WACouoponScreen';

  @override
  WACouoponScreenState createState() => WACouoponScreenState();
}

class WACouoponScreenState extends State<WACouoponScreen> {
  //List<WAVoucherModel> voucherList = waVouchersList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Couponss',
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
            padding: EdgeInsets.only(top: 40),
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage('images/mobile_banking/wa_bg.jpg'),
            //         fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    child: BreathingGlowingBox(
                      glowColor: Color.fromARGB(255, 230, 37, 95),
                      buttonBackgroundColor: Colors.transparent,
                      onTap: () {
                        // if (kDebugMode) {
                        //   print("hello wolrd");
                        // }
                      },
                    ),
                    onTap: () {
                      print("hello world");
                    },
                  ),
                  15.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BreathingGlowingBoxTwo(
                        //width: 50,
                        glowColor: Color.fromARGB(223, 255, 106, 47),
                        buttonBackgroundColor: Colors.transparent,
                        onTap: () {
                          if (kDebugMode) {
                            print("hello wolrd");
                          }
                        },
                      ),
                      BreathingGlowingBoxThree(
                          glowColor: Color.fromARGB(230, 57, 172, 248),
                          buttonBackgroundColor: Colors.transparent,
                          onTap: () {
                            if (kDebugMode) {
                              print("hello wolrd");
                            }
                          })
                    ],
                  ),
                  15.height,
                  BreathingGlowingBoxFour(
                      glowColor: Color(0xffff3990),
                      buttonBackgroundColor: Colors.transparent,
                      onTap: () {
                        if (kDebugMode) {
                          print("hello wolrd");
                        }
                      }),
                  20.height,
                  BreathingGlowingBoxFive(
                      glowColor: Color(0xff0700fe),
                      buttonBackgroundColor: Colors.transparent,
                      onTap: () {
                        if (kDebugMode) {
                          print("hello wolrd");
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
