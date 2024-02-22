import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';

import 'package:nb_utils/nb_utils.dart';


import '../main.dart';
import '../model/cardDetailsModel.dart';
import 'CarLoanIntroScreen.dart';
import 'WABillPayScreen.dart';
import 'WACreditCardScreen.dart';
//import 'WADifferentLoansScreen.dart';
import 'WAHajjUmrahLoanIntroScreen.dart';
import 'WARewardsScreen.dart';
import 'WARewardsTwoScreen.dart';
import 'WASendMoneyViaLoopScreen.dart';

import 'WATicketUrlScreen.dart';
import 'WAVoucherScreen.dart';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCashOutScreen extends StatefulWidget {
  // final CreditCardModel data;

  // //var futureList;
  // const WAOperatorsScreen({
  //   Key? key,
  //   required this.data,
  //   //required this.futureList,
  // })  : assert(data != null),
  //       super(key: key);

  static String tag = '/QRCashOutScreen';

  @override
  QRCashOutScreenState createState() => QRCashOutScreenState(/*data:data*/);
}

class QRCashOutScreenState extends State<QRCashOutScreen> {
  // WAOperatorsScreenState({
  //   required this.data,
  //   //required this.futureList,
  // }) : assert(data != null);
  // final CreditCardModel data;
  String dropdownValue = '400001******0595';
  TextEditingController amountController = TextEditingController(
    text: "AED: ",
  );
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
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Cash Out',
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
            padding: EdgeInsets.only(top: 80),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                    fit: BoxFit.cover)),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.height,
                // QrImage(
                //   data: "11111111",
                //   size: 280,
                //   backgroundColor: Colors.blueAccent,
                //   // You can include embeddedImageStyle Property if you
                //   //wanna embed an image from your Asset folder
                //   embeddedImageStyle: QrEmbeddedImageStyle(
                //     color: Colors.blueAccent,
                //     size: const Size(
                //       100,
                //       100,
                //     ),
                //   ),
                // ),
                40.height,
                Text(
                  'Show this QR code to the Merchant to get Money',
                  style: boldTextStyle(color: Colors.black, size: 15),
                ),
              ],
            )),
      ),
    );
  }
}
