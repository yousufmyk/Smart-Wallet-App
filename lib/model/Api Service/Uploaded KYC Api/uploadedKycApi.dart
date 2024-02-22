import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../cxDetailsModel.dart';
import 'package:http/http.dart' as http;

class UplaodedKycApiService extends StatelessWidget {
  const UplaodedKycApiService({Key? key}) : super(key: key);
  Future<CxDetailsModel> getCusData() async {
    var token = await SessionManager().get("token");
    final response = await http.get(
      Uri.parse(
          'http://sandboxdev.omaemirates.com:9502/NanoCustomerService/v1/customer/getCustomerInfo/OMA/0000000000866'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print("GetCxDetails Api Working Fine");
      return CxDetailsModel.fromJson(data);
    } else {
      print("GetCxDetails Api Not Working");
      return CxDetailsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CxDetailsModel>(
        future: getCusData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Row(
              children: [
                Image(
                  // image: NetworkImage(
                  //   "${snapshot.data!.customer!.customerFrontKycImg.toString()}",
                  // ),
                  image: AssetImage('images/mobile_banking/Screenshot_2023-03-17_161632-removebg-preview.png'),
                  //image: AssetImage("images/mobile_banking/Screenshot_2023-03-17_161632-removebg-preview.png"),
                  height: 150,
                  width: 150,
                ),
                10.width,
                Image(
                  // image: NetworkImage(
                  //   "${snapshot.data!.customer!.customerBackKycImg.toString()}",
                  // ),
                  image: AssetImage("images/mobile_banking/Screenshot_2023-03-17_161659-removebg-preview.png"),
                  height: 150,
                  width: 150,
                )
              ],
            );
          } else {
            return const Text('Loading your previous uploaded Kyc');
          }
        });
  }
}