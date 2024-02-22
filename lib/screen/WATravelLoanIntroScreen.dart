import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gif_view/gif_view.dart';

import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../model/cardDetailsModel.dart';
import '../utils/WAColors.dart';
// import '../utils/widgets/slider.dart';
import 'package:slider_button/slider_button.dart';

import 'WATravelLoanCalculatorScreen.dart';

class TravelLoanIntroScreen extends StatelessWidget {
   final CreditCardModel data;

  //var futureList;
  const TravelLoanIntroScreen({
    Key? key,
    required this.data,
    //required this.futureList,
  })  : assert(data != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Loans For Your Next Trip',
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
        width: context.width(),
        height: context.height(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/mobile_banking/wa_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GifView.asset(
                'images/mobile_banking/Record_2023_03_14_09_48_55_786 (1).gif',
                height: 300,
                width: 500,
                frameRate: 30,
                progress: Text("Loading..."), // default is 15 FPS
              ),
             Align(
              alignment: Alignment.centerLeft,
               child: Column(
               // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text("Basic Features & Charges : ",
                      style: boldTextStyle(
                          color: Color.fromARGB(255, 185, 64, 57), size: 20)),
                  Text(
                      "• Up to AED500,000 Emergency Medical Expenses.",
                      style: boldTextStyle(color: Colors.black, size: 15)),
                  5.height,
                  Text("• COVID-19 Medical Expenses up to AED250,000.  ",
                      style: boldTextStyle(color: Colors.black, size: 15)),
                  5.height,
                  Text("• Baggage Loss or Damage up to AED2,500.           ",
                      style: boldTextStyle(color: Colors.black, size: 15)),
                  5.height,
                  Text("• Trip Cancellation up to AED5,000.                          ",
                      style: boldTextStyle(color: Colors.black, size: 15)),
                  5.height,
                  Text("• Emergency Family Travel up to AED2,500.            ",
                      style: boldTextStyle(color: Colors.black, size: 15)),
                  5.height,
                  Text("• 24h Worldwide Assistance Services.                     ",
                      style: boldTextStyle(color: Colors.black, size: 15)),
                  
                ],
               ),
             ),
             20.height,
              Text(
                "Plan Your next Trip with us \n Get instent travel loan",
                style: boldTextStyle(color: Colors.black, size: 20),
                textAlign: TextAlign.center,
              ),
              20.height,
              SliderButton(
                buttonSize: 50,
                backgroundColor: WAPrimaryColor,
                dismissible: true,
                disable: false,
                action: () {
                  ///Do something here
                  // showInDialog(context, builder: (context) {
                  //   return WAMoneyTransferCompleteDialog(
                  //     data: data,
                  //   );
                  // });
                  TravelLoanCalculatorScreen(data: data,).launch(context);
                },
                label: Text("Slide To begin", style: boldTextStyle()),
                icon: Icon(Icons.arrow_forward, color: WAPrimaryColor),
              ).center(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
