import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/screen/WADashboardScreen.dart';
import 'package:wallet_app/screen/WAVerificationScreen.dart';
import 'package:wallet_app/utils/WAColors.dart';


import '../model/cardDetailsModel.dart';

class WAAddCredentialScreen extends StatefulWidget {
 final CreditCardModel data;

  const WAAddCredentialScreen({
    Key? key,
    required this.data,
  })  : assert(data != null),
        super(key: key);
  static String tag = '/WAAddCredentialScreen';

  @override
  WAAddCredentialScreenState createState() => WAAddCredentialScreenState(data : data);
}

class WAAddCredentialScreenState extends State<WAAddCredentialScreen> {
  final CreditCardModel data;

   WAAddCredentialScreenState({
    required this.data,
  }) : assert(data != null);
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
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Text('SKIP', style: boldTextStyle(color: black))
              .paddingOnly(right: 16)
              .center()
              .onTap(() {
            WADashboardScreen(/*data: data,*/).launch(context);
          }),
        ],
      ),
      body: Container(
        height: context.height(),
        width: context.width(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/mobile_banking/wa_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/mobile_banking/wa_add_creditional.png',
              width: context.width() * 0.80,
              height: context.width() * 0.80,
              fit: BoxFit.cover,
            ),
            8.height,
            Text(
              'Add Creditionals to Loop',
              style: boldTextStyle(size: 20, color: black),
              textAlign: TextAlign.center,
            ),
            16.height,
            Text(
              'Add your bank credit/debit card to Loop for manage your experience and set your budget for saving',
              style: secondaryTextStyle(color: gray),
              textAlign: TextAlign.center,
            ),
            30.height,
            SizedBox(
              width: context.width() * 0.5,
              child: AppButton(
                  text: "Next",
                  color: WAPrimaryColor,
                  textColor: Colors.white,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  width: context.width(),
                  onTap: () {
                    WAVerificationScreen(data: data,).launch(context);
                  }),
            ),
          ],
        ).paddingOnly(left: 30, right: 30).paddingTop(40),
      ),
    );
  }
}
