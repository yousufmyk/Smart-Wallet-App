import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:http/http.dart' as http;
import 'package:wallet_app/model/WalletAppModel.dart';
import '../dashboard/limit_fragment.dart';
import '../dashboard/smart_home/utils/AppColors.dart';
import '../model/Api Service/Balance Api/checkBalanceApi.dart';
import '../model/CardsLimitModel.dart';
import '../model/cardDetailsModel.dart';
import '../screen/WAManageCardLimitsScreen.dart';
import '../screen/WAPinScreen.dart';

class WACardComponent extends StatefulWidget {
  // final CreditCardModel data;
  // static String tag = '/WACardComponent';
  final WACardModel? cardModel;

  const WACardComponent(
      {Key? key, /*required this.data*/ required this.cardModel});
  // : assert(data != null),
  //   super(key: key);

  @override
  WACardComponentState createState() => WACardComponentState(/*data: data*/);
}

class WACardComponentState extends State<WACardComponent> {
  // WACardComponentState({
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

  bool newIcon = true;
  bool initialPosition = true;
  // Future<CreditCardModel> getCardData() async {
  //   const token =
  //       "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJpbnN0SWRcIjpcIk9NQVwiLFwidXNlck5hbWVcIjpcInlvdXN1ZjFcIixcInBhc3N3b3JkXCI6XCI1YmFhNjFlNGM5YjkzZjNmMDY4MjI1MGI2Y2Y4MzMxYjdlZTY4ZmQ4XCIsXCJwaW5cIjpcIjcxMTBlZGE0ZDA5ZTA2MmFhNWU0YTM5MGIwYTU3MmFjMGQyYzAyMjBcIixcInJvbGVcIjpcIk1FUkNIQU5UXCIsXCJkZXZpY2VUeXBlXCI6XCJNT0JJTEVcIixcImFwcGxpY2F0aW9uQWNjZXNzXCI6bnVsbCxcImV4cGlyYXRpb25UaW1lXCI6NDMyMDAsXCJtb2JpbGVDb3VudHJ5Q29kZVwiOlwiKzkxXCIsXCJtb2JpbGVOdW1iZXJcIjpcIjk2MDA1Mjc0OTJcIixcImVtYWlsSWRcIjpcInlvdXN1ZjFAb21hZW1pcmF0ZXMuY29tXCIsXCJjdXN0SWRcIjpcIjAwMDAwMDAwMDAxMTFcIixcIndhbGxldElkXCI6bnVsbCxcImFjY291bnROdW1iZXJcIjpudWxsLFwiY2FyZFJlZmVyZW5jZU51bWJlclwiOm51bGx9IiwiZXhwIjoxNjcxMjk3NTk3LCJpYXQiOjE2NzEyNTQzOTd9.j4SwVQKybTe5bt5uu1z5PTpLC7Z8756AZvUSRlZQ8qoxuyVmMqcza2ASMXRZIvCdIeRX7U-edX7d_Bz7n2Ftcg";
  //   final response = await http.get(
  //     Uri.parse(
  //         'http://sandboxdev.omaemirates.com:9501/NanoCMS/v1/nanocms/getCardInfo/OMA/OMA0000000000265'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': 'Bearer $token',
  //     },
  //   );
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     return CreditCardModel.fromJson(data);
  //   } else {
  //     return CreditCardModel.fromJson(data);
  //   }
  // }

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
    return SingleChildScrollView(
      child: Container(
        width: 300,
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 8),
        decoration: boxDecorationRoundedWithShadow(
          30,
          //backgroundColor: widget.cardModel!.color!,
          //backgroundColor: Color(0xFFFF7426),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff3B7197),
                // Color(0xff6D22C7),
                Color(0xff4A8DB7),
                Color(0xff74BDE0),
                Color(0xffA1E1FA),
              ]),
          blurRadius: 10.0,
          spreadRadius: 4.0,
          shadowColor: widget.cardModel!.color!.withAlpha(50),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    // data.cardOrderInfo!.primaryCardOrderInfo!.nameOnCard!
                    //     .toUpperCase(),
                    'Mohamed Yousuf',
                    style: primaryTextStyle(color: Colors.white70)),
                Align(
                  alignment: Alignment.topRight,
                  // child: ImageIcon(
                  //   AssetImage('images/mobile_bankingmastercard-4-removebg-preview.png'),
                  //   size: 50,
                  //   color: Colors.white,
                  // ),
                  child: Image(
                    image: AssetImage(
                      'images/mobile_banking/mastercard-4-removebg-preview.png',
                    ),
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Balance',
                    style: secondaryTextStyle(color: Colors.white60)),
                Visibility(
                  maintainSize: false,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: status,
                  child: Text("CVV: 665",
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
                // if (CardStatus == false)
                //   Text(data.cardOrderInfo!.primaryCardOrderInfo!.card.toString(),
                //       style: primaryTextStyle(color: Colors.white70)),
                // if (CardStatus == true)
                //   Text("4000016544560595",
                //       style: primaryTextStyle(color: Colors.white70)),
                Text("4000016544560595",
                    style: primaryTextStyle(color: Colors.white70)),
                Text(
                    // data.cardOrderInfo!.primaryCardOrderInfo!.expiryDate
                    //     .toString(),
                    "06/28",
                    style: primaryTextStyle(color: Colors.white70)),
              ],
            ),
            Divider(thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      WAPinScreen(
                              /*data: data,*/
                              )
                          .launch(context);
                    },
                    child:
                        // Text("Pin", style: primaryTextStyle(color: Colors.white70)),
                        Icon(
                      Icons.pin,
                      color: Colors.white70,
                    )),
                GestureDetector(
                    onTap: () {
                      // LimitFragment(
                      //   /*data: data,*/
                      // ).launch(context);
                    },
                    child: /*Text("Limits",
                    style: primaryTextStyle(color: Colors.white70)),*/
                        Icon(
                      Icons.bar_chart,
                      color: Colors.white70,
                    )),
                GestureDetector(
                  onTap: () {
                    if (isSwitched == false) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Your card is disabled')));
                    }
                  },
                  child: Switch(
                    onChanged: toggleSwitch,
                    value: isSwitched,
                    activeColor: Colors.red,
                    activeTrackColor: Colors.white,
                    inactiveThumbColor: Colors.green,
                    inactiveTrackColor: Colors.white,
                  ),
                ),
                Text("$cardStatus",
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
      ).onTap(() {}),
    );
  }
}
