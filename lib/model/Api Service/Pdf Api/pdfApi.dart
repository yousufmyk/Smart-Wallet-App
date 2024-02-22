import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

import '../../../component/WAPdfComponentTwo.dart';
import '../../pdfModel.dart';


class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  Future<Pdfmodel> getpostStatment() async {
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
      return Pdfmodel.fromJson(data);
    } else {
      return Pdfmodel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Pdfmodel>(
            future: getpostStatment(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.content!.length,
                    itemBuilder: (context, index) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            // PdfView()
                            PdfView(
                              accNum: snapshot.data!.content![index].custId!
                                  .toString(),
                              channelTpy: snapshot
                                  .data!.content![index].channelType!
                                  .toString(),
                              custId: snapshot.data!.content![index].custId!
                                  .toString(),
                              feeAmunt: snapshot
                                  .data!.content![index].feeAmount!
                                  .toString(),
                              instId: snapshot.data!.content![index].instId!
                                  .toString(),
                              processFlag: snapshot
                                  .data!.content![index].processFlag!
                                  .toString(),
                              productId: snapshot
                                  .data!.content![index].matchDescription!
                                  .toString(),
                              totalAmount: snapshot
                                  .data!.content![index].amount!
                                  .toString(),
                              traceNum: snapshot
                                  .data!.content![index].traceNumber!
                                  .toString(),
                              tranDateTime: snapshot
                                  .data!.content![index].tranDateTime!
                                  .toString(),
                              tranTyp: snapshot.data!.content![index].tranType!
                                  .toString(),
                            )
                          ],
                        );
                      } else {
                        return Text("laoding");
                      }
                    });
              } else {}
              return Text("loading");
            }));
  }
}
