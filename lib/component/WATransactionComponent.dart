import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/model/WalletAppModel.dart';


import '../../../main.dart';
import '../model/TransactionHistryModel.dart';
import 'package:http/http.dart' as http;

class WATransactionComponent extends StatefulWidget {
  static String tag = '/WATransactionComponent';

  final WATransactionModel? transactionModel;

  WATransactionComponent({this.transactionModel});

  @override
  WATransactionComponentState createState() => WATransactionComponentState();
}

class WATransactionComponentState extends State<WATransactionComponent> {
  @override
  void initState() {
    super.initState();
    //init();
  }

  // Future<void> init() async {
  //   //
  // }
  Future<TransactionHistoryModel> getpostStatment() async {
    var token = await SessionManager().get("token");
    final response = await http.post(
      Uri.parse(
          'http://sandboxdev.omaemirates.com:9503/NanoSmartBanking/v1/smartBanking/transactionSearch?size=5'),
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
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TransactionHistoryModel>(
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
                        margin:
                            EdgeInsets.only(bottom: 16, left: 16, right: 16),
                        decoration: boxDecorationRoundedWithShadow(16,
                            backgroundColor: context.cardColor),
                        child: ListTile(
                          tileColor: Colors.red,
                          enabled: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: boxDecorationWithRoundedCorners(
                              boxShape: BoxShape.circle,
                              backgroundColor: widget.transactionModel!.color!
                                  .withOpacity(0.1),
                            ),
                            child: ImageIcon(
                              AssetImage('${widget.transactionModel!.image!}'),
                              size: 24,
                              color: widget.transactionModel!.color!,
                            ),
                          ),
                          title: RichTextWidget(
                            list: [
                              TextSpan(
                                text: snapshot.data!.content![index].tranType!
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
                                    color:
                                        appStore.isDarkModeOn ? white : black),
                              ),
                            ],
                            maxLines: 1,
                          ),
                          subtitle: Text(
                            snapshot.data!.content![index].tranDateTime!
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
                            decoration: boxDecorationWithRoundedCorners(
                              borderRadius: BorderRadius.circular(30),
                              backgroundColor: widget.transactionModel!.color!
                                  .withOpacity(0.1),
                            ),
                            child: Text(
                              snapshot.data!.content![index].amount!.toString(),
                              maxLines: 1,
                              style: boldTextStyle(
                                  size: 12,
                                  color: widget.transactionModel!.color!),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                });
          } else {
            return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        margin:
                            EdgeInsets.only(bottom: 16, left: 16, right: 16),
                        decoration: boxDecorationRoundedWithShadow(16,
                            backgroundColor: context.cardColor),
                        child: ListTile(
                          tileColor: Colors.red,
                          enabled: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: boxDecorationWithRoundedCorners(
                              boxShape: BoxShape.circle,
                              backgroundColor: widget.transactionModel!.color!
                                  .withOpacity(0.1),
                            ),
                            child: ImageIcon(
                              AssetImage('${widget.transactionModel!.image!}'),
                              size: 24,
                              color: widget.transactionModel!.color!,
                            ),
                          ),
                          title: RichTextWidget(
                            list: [
                              TextSpan(
                                // text: snapshot.data!.content![index].tranType!
                                //     .toString(),
                                text: 'POS At ',
                                style: primaryTextStyle(
                                    color: appStore.isDarkModeOn
                                        ? white
                                        : Colors.black54,
                                    size: 14),
                              ),
                              TextSpan(
                                // text:
                                //     ' to ${snapshot.data!.content![index].walletId!.toString()}',
                                text: 'Coffee Shop',
                                style: boldTextStyle(
                                    size: 14,
                                    color:
                                        appStore.isDarkModeOn ? white : black),
                              ),
                            ],
                            maxLines: 3,
                          ),
                          subtitle: Text(
                            // snapshot.data!.content![index].tranDateTime!
                            //     .toString(),
                            '10/6/2023',
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
                            decoration: boxDecorationWithRoundedCorners(
                              borderRadius: BorderRadius.circular(30),
                              backgroundColor: widget.transactionModel!.color!
                                  .withOpacity(0.1),
                            ),
                            child: Text(
                              // snapshot.data!.content![index].amount!.toString(),
                              '50',
                              maxLines: 1,
                              style: boldTextStyle(
                                  size: 12,
                                  color: widget.transactionModel!.color!),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
          }
        });
  }
}
