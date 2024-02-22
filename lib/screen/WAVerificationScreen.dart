import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:otp_text_field/otp_field.dart' as prefix;
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import 'package:nb_utils/src/widgets/otp_text_field.dart' as prefix;
import 'package:wallet_app/utils/WAColors.dart';

import '../main.dart';
import '../model/cardDetailsModel.dart';
import 'WADashboardScreen.dart';

class WAVerificationScreen extends StatefulWidget {
  final CreditCardModel data;

  const WAVerificationScreen({
    Key? key,
    required this.data,
  })  : assert(data != null),
        super(key: key);
  static String tag = '/WAVerificationScreen';

  @override
  WAVerificationScreenState createState() => WAVerificationScreenState(data:data);
}

class WAVerificationScreenState extends State<WAVerificationScreen> {
   WAVerificationScreenState({
    required this.data,
  }) : assert(data != null);
  final CreditCardModel data;
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      ),
      body: Container(
        height: context.height(),
        width: context.width(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/mobile_banking/wa_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              30.height,
              Image.asset(
                'images/mobile_banking/wa_verification.png',
              ),
              8.height,
              Text(
                'Verification',
                style: boldTextStyle(size: 20, color: black),
                textAlign: TextAlign.center,
              ),
              16.height,
              Text(
                'We have send a 4 digit verification code to your mail. Please enter the code below to verify it\'s you',
                style: secondaryTextStyle(color: gray),
                textAlign: TextAlign.center,
              ),
              30.height,
              Wrap(
                children: [
                  SizedBox(
                      height: 60,
                     
                      // ),
                      child: OTPTextField(
                         
                          pinLength: 5,
                          
                          fieldWidth: 45,
                         
                          onChanged: (pin) {
                            print("Changed: " + pin);
                          },
                          onCompleted: (pin) {
                            print("Completed: " + pin);
                          })),
                ],
              ),
              16.height,
              Row(
               
                children: [
                  Text('I didn\'t get the Code.',
                      style: secondaryTextStyle(color: gray)),
                  4.width,
                  Text('Resend Code',
                      style: boldTextStyle(color: WAPrimaryColor),
                      textAlign: TextAlign.center),
                ],
              ),
              16.height,
              SizedBox(
                width: context.width() * 0.5,
                child: AppButton(
                    text: "Verify Me",
                    color: WAPrimaryColor,
                    textColor: Colors.white,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    width: context.width(),
                    onTap: () {
                      WADashboardScreen(/*data: data,*/).launch(context);
                    }),
              ),
            ],
          ).paddingAll(30),
        ),
      ),
    );
  }
}
