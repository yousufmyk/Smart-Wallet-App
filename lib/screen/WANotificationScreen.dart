import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../model/TransactionHistryModel.dart';
import 'package:http/http.dart' as http;

class WANotificationScreen extends StatefulWidget {
 
  static String tag = '/WANotificationScreen';

  @override
  WANotificationScreenState createState() => WANotificationScreenState();
}

class WANotificationScreenState extends State<WANotificationScreen> {
  

  Future<TransactionHistoryModel> getpostStatment() async {
    var token = await SessionManager().get("token");
    final response = await http.post(
      Uri.parse(
          'http://sandboxdev.omaemirates.com:9503/NanoSmartBanking/v1/smartBanking/transactionSearch?size=10'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        "accountNumber": "0000000000001",
        "cardReferenceNumber1": "OMA0000000000001",
        "tranDateFrom": "06-11-2022"
      }),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return TransactionHistoryModel.fromJson(data);
    } else {
      return TransactionHistoryModel.fromJson(data);
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void dispose() {
    super.dispose();
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Notifications',
              style: boldTextStyle(color: Colors.black, size: 20)),
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
            padding: EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                    fit: BoxFit.cover)),
            child: FutureBuilder<TransactionHistoryModel>(
                future: getpostStatment(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.content!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                margin: EdgeInsets.only(
                                    bottom: 16, left: 16, right: 16),
                                decoration: boxDecorationRoundedWithShadow(16,
                                    backgroundColor: context.cardColor),
                                child: SingleChildScrollView(
                                  child: ListTile(
                                    tileColor: Colors.red,
                                    enabled: true,
                                    contentPadding: EdgeInsets.zero,
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      alignment: Alignment.center,
                                      
                                      child: Icon(
                                        Icons.notifications,
                                        color: Colors.blue,
                                        size: 40,
                                      ),
                                      
                                    ),
                                    title: RichTextWidget(
                                      list: [
                                        TextSpan(
                                          text: snapshot
                                              .data!.content![index].tranType!
                                              .toString(),
                                          style: primaryTextStyle(
                                              color: appStore.isDarkModeOn
                                                  ? white
                                                  : Colors.black54,
                                              size: 14),
                                        ),
                                        TextSpan(
                                          text:
                                              ' to ${snapshot.data!.content![index].walletId!.toString()}',
                                          style: boldTextStyle(
                                              size: 14,
                                              color: appStore.isDarkModeOn
                                                  ? white
                                                  : black),
                                        ),
                                      ],
                                      maxLines: 1,
                                    ),
                                    subtitle: Text(
                                      snapshot
                                          .data!.content![index].tranDateTime!
                                          .toString(),
                                      style: primaryTextStyle(
                                          color: appStore.isDarkModeOn
                                              ? white
                                              : Colors.black54,
                                          size: 14),
                                    ),
                                    trailing: Container(
                                      width: 80,
                                      height: 35,
                                      alignment: Alignment.center,
                                    
                                      child: Text(
                                        snapshot.data!.content![index].amount!
                                            .toString(),
                                        maxLines: 1,

                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        });
                  } else {
                    return const Text('Loading');
                  }
                })
           

            ).paddingAll(0),
      ),
    );
  }
}
