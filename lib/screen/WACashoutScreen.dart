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
import 'WAQrCodeForCashOutScreen.dart';
import 'WARewardsScreen.dart';
import 'WARewardsTwoScreen.dart';
import 'WASendMoneyViaLoopScreen.dart';

import 'WATicketUrlScreen.dart';
import 'WAVoucherScreen.dart';

class CashOutScreen extends StatefulWidget {
  // final CreditCardModel data;

  // //var futureList;
  // const WAOperatorsScreen({
  //   Key? key,
  //   required this.data,
  //   //required this.futureList,
  // })  : assert(data != null),
  //       super(key: key);

  static String tag = '/CashOutScreen';

  @override
  CashOutScreenState createState() => CashOutScreenState(/*data:data*/);
}

class CashOutScreenState extends State<CashOutScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text('Cash Out Via',
                        style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                8.height,
                Container(
                  child: DropdownButton<String>(
                    // Step 3.
                    icon: Icon(Icons.arrow_drop_down_circle_outlined),
                    isExpanded: true,
                    disabledHint: Text("Select"),
                    //dropdownColor: Color.fromARGB(255, 99, 185, 255),

                    value: dropdownValue,
                    // Step 4.
                    items: <String>[
                      '400001******0595',
                      '400001******0603',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    }).toList(),
                    // Step 5.
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ).paddingLeft(16),
                16.height,
                Text('Enter Amount',
                        style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                8.height,
                AppTextField(
                  controller: amountController,
                  autoFocus: false,
                  textAlign: TextAlign.center,
                  textFieldType: TextFieldType.OTHER,
                  keyboardType: TextInputType.number,
                  textStyle: TextStyle(fontSize: 22, color: black),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.5))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.5))),
                  ),
                ).paddingOnly(left: 16, right: 16),
                5.height,
                Text("Maximum withdrawal of AED: 500"),
                IconButton(
                  onPressed: () {
                    QRCashOutScreen().launch(context);
                    if (kDebugMode) {
                      print("helloWorld");
                    }
                  },
                  icon: GifView.asset(
                    'images/mobile_banking/Record_2023_02_28_11_03_21_409.gif',
                    height: 300,
                    width: 500,
                    frameRate: 60, // default is 15 FPS
                    progress: Text("Loading..."),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text("Click Aboove QR Icon to generate QR code"),
                ),
              ],
            )),
      ),
    );
  }
}
