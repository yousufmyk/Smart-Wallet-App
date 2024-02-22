import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

import '../../checkBalanceModel.dart';

class CheckBalanceApiService extends StatefulWidget {
  const CheckBalanceApiService({Key? key}) : super(key: key);

  @override
  State<CheckBalanceApiService> createState() => _CheckBalanceApiServiceState();
}

class _CheckBalanceApiServiceState extends State<CheckBalanceApiService> {
  // Future<CheckBalanceModel> getBalance() async {
  //   var token = await SessionManager().get("token");
  //   final response = await http.post(
  //     Uri.parse(
  //         'http://sandboxdev.omaemirates.com:9503/NanoSmartBanking/v1/smartBanking/balanceCheck'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': 'Bearer $token',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "instId": "OMA",
  //       "transaction": "BALANCECHECK",
  //       "custId": "0000000000002",
  //       "fundSource": "WALLET",
  //       "description": "BALANCE CHECK",
  //       "accountNumber": "0000000000002",
  //       "mpin": "123456"
  //     }),
  //   );
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     return CheckBalanceModel.fromJson(data);
  //   } else {
  //     return CheckBalanceModel.fromJson(data);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<CheckBalanceModel>(
    //     future: getBalance(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         return Text(
    //             '${snapshot.data!.receipt!.availableBalance!.toString()} د.إ ',
    //             style: boldTextStyle(color: Colors.white, size: 18));
    //       } else {
    //         return const Text('Loading');
    //       }
    //     });
    return  Text(
                '624 د.إ ',
                style: boldTextStyle(color: Colors.white, size: 18));
  }
}
