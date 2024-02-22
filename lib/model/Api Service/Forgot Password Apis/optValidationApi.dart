import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../../../Controllers/ForgotPinController.dart';
import '../../../screen/WAForgotPasswordScreen.dart';

class oTpValidationApi extends StatefulWidget {
  const oTpValidationApi({Key? key}) : super(key: key);

  @override
  State<oTpValidationApi> createState() => _oTpValidationApiState();
}

class _oTpValidationApiState extends State<oTpValidationApi> {
  var controller = Get.put(ForgotPinController());
  Future validateOtp() async {
    var userName = await SessionManager().get("userdata");
    final optToVerify =  controller.otp.text.toString();
    final response = await http.post(
      Uri.parse(
          'http://sandboxdev.omaemirates.com:9502/NanoCustomerService/v1/customer/validateOTP'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "instId": "OMA",
        "userName": userName,
        "otp": optToVerify
      }),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return {print("Sucess validate")};
    } else {
      return {print("there is some error"), print(controller.otp.text)};

    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()  {
        //await validateOtp();
         WAForgotPassWordScreen();
        //print(controller.otp.text.toString());
      },
      child: const Text('Validate'),
    );
  }
}
