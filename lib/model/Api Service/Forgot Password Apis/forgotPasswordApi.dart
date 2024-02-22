import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import '../../../Controllers/ForgotPinController.dart';
import '../../../utils/WAColors.dart';
// import '../../../utils/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

// import 'package:mobile_banking/utils/widgets/slider.dart';
import 'package:slider_button/slider_button.dart';

class ForgotPassWordApi extends StatefulWidget {
  const ForgotPassWordApi({Key? key}) : super(key: key);

  @override
  State<ForgotPassWordApi> createState() => _ForgotPassWordApiState();
}

class _ForgotPassWordApiState extends State<ForgotPassWordApi> {
   var controller = Get.put(ForgotPinController());
  Future forgotPassWord() async {
   // var controller = await Get.put(ForgotPinController());
    var userName = await SessionManager().get("userdata");
    var token = await SessionManager().get("token");
    final optToVerify = controller.otp.text.toString();
    final newPassWord = controller.enterNewPin.text.toString();
    final confrimNewPass = controller.confirmEnterNewPin.text.toString();
    final response = await http.post(
      Uri.parse(
          'http://sandboxdev.omaemirates.com:9502/NanoCustomerService/v1/customer/passwordResetOrChange/pwdReset'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        "instId": "OMA",
        "userName": userName,
        "newPin": newPassWord,
        "confirmNewPin": confrimNewPass,
        "otp": optToVerify,
        "deviceType": "MOBILE"
      }),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return {print("PassWord Changed Sucessfully")};
    } else {
      return {
        print("there is some error"),
        print(
          response.body.toString(),
        ),
        print(newPassWord.toString()),
        print(confrimNewPass.toString())
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliderButton(
      buttonSize: 50,
      backgroundColor: WAPrimaryColor,
      dismissible: true,
      action: () {
        forgotPassWord();
      },
      label: Text("Swipe to submit", style: boldTextStyle()),
      icon: Icon(Icons.arrow_forward, color: WAPrimaryColor),
    ).center();
  }
}
