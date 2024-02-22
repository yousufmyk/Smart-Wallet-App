import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:http/http.dart' as http;
import 'package:wallet_app/model/WalletAppModel.dart';
import '../dashboard/limit_fragment.dart';
import '../model/Api Service/Balance Api/checkBalanceApi.dart';
import '../model/cardDetailsModel.dart';
import '../screen/WAPinScreen.dart';
import '../screen/WAPinScreenForSecondCard.dart';

class WACardComponent2 extends StatefulWidget {
  static String tag = '/WACardComponent';
  final WACardModel2? cardModel2;
  // final CreditCardModel data;

  WACardComponent2({
    this.cardModel2,
    /*required this.data*/
  });

  @override
  WACardComponent2State createState() => WACardComponent2State(/*data: data*/);
}

class WACardComponent2State extends State<WACardComponent2> {
  // WACardComponent2State({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;

  List<bool> _selections = List.generate(3, (_) => false);
  var TxtBold = FontWeight.normal;
  var TxtItalic = FontStyle.normal;
  var TxtUnder = TextDecoration.none;
  var cardStatus = "";

  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
        cardStatus = "Blocked";
      });

      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
        cardStatus = "Unblocked";
      });

      print('Switch Button is OFF');
    }
  }

  bool status = false;

  _onChanged(status) async {
    //bool user = await SessionManager().containsKey("userdata");
    if (status == true) {
      setState(() {
        status = true;
        // print("hello");
        // print(user.toString());
      });
    } else {
      setState(() {
        status = false;
      });
    }
  }

  bool CardStatus = false;
  _showCardNum(CardStatus) async {
    if (CardStatus == true) {
      setState(() {
        CardStatus = true;
      });
    } else {
      setState(() {
        CardStatus = false;
      });
    }
  }

  bool newIcon = true;
  bool initialPosition = true;

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
    return Container(
      width: 300,
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 8),
      decoration: boxDecorationRoundedWithShadow(
        30,
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff41436A),
              // Color(0xff6D22C7),
              Color(0xff974063),
              Color(0xffF54786),
              Color(0xffFF9677),
            ]),
        blurRadius: 10.0,
        spreadRadius: 4.0,
        shadowColor: widget.cardModel2!.color!.withAlpha(50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  // data.cardOrderInfo!.secondaryCardOrderInfo!
                  //     .elementAt(0)
                  //     .nameOnCard!
                  //     .toUpperCase(),
                  'AHAMED',
                  //"Secondary",
                  style: primaryTextStyle(color: Colors.white70)),
              Align(
                alignment: Alignment.topRight,
                child: ImageIcon(
                  AssetImage('images/mobile_banking/wa_visa.png'),
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Balance', style: secondaryTextStyle(color: Colors.white60)),
              Visibility(
                maintainSize: false,
                maintainAnimation: true,
                maintainState: true,
                visible: status,
                child: Text("CVV: 729",
                    style: boldTextStyle(color: Colors.white, size: 15)),
              )
            ],
          ),
          2.height,
          CheckBalanceApiService(),
          2.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  // data.cardOrderInfo!.secondaryCardOrderInfo!
                  //     .elementAt(0)
                  //     .card!
                  //     .toUpperCase(),
                  '5124801165770984',
                  style: primaryTextStyle(color: Colors.white70)),
              Text(
                  // data.cardOrderInfo!.secondaryCardOrderInfo!
                  //     .elementAt(0)
                  //     .expiryDate!
                  //     .toUpperCase(),
                  '06/2029',
                  style: primaryTextStyle(color: Colors.white70)),
            ],
          ),
          Divider(thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    // WAPinScreenSecondCard(
                    //   data: data,
                    // ).launch(context);
                  },
                  child: Text("Pin",
                      style: primaryTextStyle(color: Colors.white70))),
              GestureDetector(
                  onTap: () {
                    // LimitFragment(
                    //   data: data,
                    // ).launch(context);
                  },
                  child: Text("Limits",
                      style: primaryTextStyle(color: Colors.white70))),
              Switch(
                onChanged: toggleSwitch,
                value: isSwitched,
                activeColor: Colors.red,
                activeTrackColor: Colors.white,
                inactiveThumbColor: Colors.green,
                inactiveTrackColor: Colors.white,
              ),
              Text("${cardStatus}",
                  style: primaryTextStyle(color: Colors.white70)),
              GestureDetector(
                  onTap: () {
                    // LimitFragment(
                    //   data: data,
                    // ).launch(context);
                    _onChanged(status = true);
                    _showCardNum(CardStatus = true);
                    //status = true;
                  },
                  onDoubleTap: () {
                    _onChanged(status = false);
                    _showCardNum(CardStatus = false);
                  },
                  child: /*Text("Reveal \n Details",
                      style: primaryTextStyle(color: Colors.white70)),*/
                      Image(
                    image: AssetImage("images/mobile_banking/eye.png"),
                    color: Colors.white70,
                  )),
            ],
          )
        ],
      ),
    ).onTap(() {});
  }
}
