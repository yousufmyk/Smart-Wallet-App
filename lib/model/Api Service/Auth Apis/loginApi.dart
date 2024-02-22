import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:get/get.dart';

import 'package:nb_utils/nb_utils.dart';

import '../../../Controllers/LogInController.dart';
import '../../../component/WAFingerPrintDailog.dart';
import '../../../screen/WADashboardScreen.dart';
import '../../../screen/WAEditProfileScreen.dart';
import '../../../screen/WALoginScreen.dart';
import '../../../screen/loginLoadingScreen.dart';
import '../../../utils/WAColors.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../../cardDetailsModel.dart';
import 'package:http/http.dart' as http;

import '../BioMetric Apis/fingerPrintApi.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginApiService extends StatefulWidget {
  @override
  State<LoginApiService> createState() => _LoginApiServiceState();
}

class _LoginApiServiceState extends State<LoginApiService> {
  final newController = Get.put(LoginController());

  // Future<bool> login(String email, String password, BuildContext context,
  //     LoginController controller) async {
  //   var emailnew = email;
  //   var newvalue = await SessionManager().get("userdata");
  //   // ignore: unnecessary_null_comparison

  //   if (emailnew.isEmpty == true) {
  //     setState(() {
  //       emailnew = newvalue.toString();
  //       // print("hello");
  //       // print(user.toString());
  //     });
  //   }

  //   try {
  //     final response = await post(
  //       Uri.parse(
  //           'http://sandboxdev.omaemirates.com:9502/NanoCustomerService/v1/login'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(<String, String>{
  //         "instId": "OMA",
  //         // "userName": email,
  //         "userName": emailnew,
  //         "deviceType": "MOBILE",
  //         "password": password,
  //         "role": "Customer",
  //         "deviceId": "M2101K7BI"
  //       }),
  //     );
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       var tokenVal = (data as Map)['bearerToken'];
  //       await SessionManager().set("token", tokenVal);
  //       print(tokenVal);
  //       await SessionManager().set("userdata", emailnew.toString());
  //       var kycMsg = (data as Map)['kycExpiryAlertMsg'];
  //       print(kycMsg);

  //       bool isExpired = true;
  //       if (isExpired == true) {
  //         await SessionManager().set("emiratesExpires", true);
  //         print("${await SessionManager().get("emiratesExpires")}");
  //         //await _onAlertButtonsPressed(context);
  //       } else if (isExpired == false) {
  //         await SessionManager().set("emiratesExpires", false);
  //         await Get.snackbar(
  //           "Warning!",
  //           kycMsg,
  //           backgroundColor: Colors.redAccent,
  //           colorText: Color.fromARGB(255, 255, 255, 255),
  //           snackPosition: SnackPosition.BOTTOM,
  //         );
  //       }

  //       try {
  //         var token = await SessionManager().get("token");
  //         final response = await http.get(
  //           Uri.parse(
  //               'http://sandboxdev.omaemirates.com:9501/NanoCMS/v1/nanocms/getCardOrderInfo/OMA/OMA0000000000067'),
  //           headers: <String, String>{
  //             'Content-Type': 'application/json; charset=UTF-8',
  //             'Authorization': 'Bearer $token',
  //           },
  //         );

  //         if (response.statusCode == 200) {
  //           var data = CreditCardModel.fromJson(jsonDecode(response.body));

  //           WAFingerPrintDialog(data: data).launch(context);
  //           // return CreditCardModel.fromJson(jsonDecode(response.body));
  //         } else {
  //           print("cards details Api not working");
  //         }
  //       } catch (e) {
  //         print("cards details Api not working");
  //       }

  //       var bearerToken = data[0];
  //       print(bearerToken);
  //       return true;
  //     } else {
  //       //print(newvalue.toString());
  //       print(password.toString());
  //       print(response.statusCode);
  //       print(email);
  //       print(newvalue);
  //       print(password);
  //       print('There is some error');
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //           content: Text('Please Enter Correct Email/Password')));
  //       return false;

  //       //_incorrectPin(context,controller);
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Please try again later')));
  //     print(e.toString());
  //   }
  //   return false;
  // }

  // Future<CreditCardModel> getCardDetails() async {
  //   try {
  //     var token = await SessionManager().get("token");
  //     final response = await http.get(
  //       Uri.parse(
  //           'http://sandboxdev.omaemirates.com:9501/NanoCMS/v1/nanocms/getCardOrderInfo/OMA/OMA0000000000067'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': 'Bearer $token',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       var data = CreditCardModel.fromJson(jsonDecode(response.body));
  //       //var data2 = CreditCardModel.fromJson(data);
  //       WADashboardScreen(
  //               data: CreditCardModel.fromJson(jsonDecode(response.body)))
  //           .launch(context);
  //       return CreditCardModel.fromJson(jsonDecode(response.body));
  //     } else {
  //       throw Exception("There is some erre");
  //     }
  //   } catch (e) {
  //     throw Exception("There is some erre");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final newController = Get.put(LoginController());
    // return AppButton(
    //         text: "Log In",
    //         color: WAPrimaryColor,
    //         textColor: Colors.white,
    //         shapeBorder:
    //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    //         width: MediaQuery.of(context).size.width,
    //         onTap: () /*async*/ {
    //           WADashboardScreen(
    //             /*data: CreditCardModel.fromJson(jsonDecode(response.body))*/)
    //         .launch(context);
    //           // WAEditProfileScreen(
    //           //         isEditProfile: false)
    //           //     .launch(context);
    //           // await login(
    //           //     newController.email.text.toString(),
    //           //     newController.password.text.toString(),
    //           //     context,
    //           //     LoginController());
    //         })
    //     .paddingOnly(
    //         left: MediaQuery.of(context).size.width * 0.1,
    //         right: MediaQuery.of(context).size.width * 0.1);
    return GestureDetector(
      onTap: () {
        // WADashboardScreen(
        //         /*data: CreditCardModel.fromJson(jsonDecode(response.body))*/)
        //     .launch(context);
        WALogInLoadingScreen().launch(context);
      },
      
      child: Container(
        height: 50,
        //width: MediaQuery.of(context).size.width,
        width: 240,
        decoration: BoxDecoration(
          //color: Colors.white,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff05D0EB),
                // Color(0xff6D22C7),
                Color(0xff6D22C7),
                Color(0xff6D22C7),
                Color(0xff6D22C7),
              ]),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            'Log In',
            style: boldTextStyle(
                size: 17, color: /*Color(0xff6D22C7)*/ Colors.white),
          ),
        ),
      ).paddingOnly(
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1),
    );
  }
}

_onAlertButtonsPressed(context) {
  Alert(
      context: context,
      //type: AlertType.warning,
      type: AlertType.warning,
      title: 'Warning alert',
      desc: 'Testing Alerts this is the Animated one',
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            'FLAT',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        DialogButton(
          onPressed: () => Navigator.pop(context),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0),
          ]),
          child: const Text(
            'GRADIENT',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        )
      ]).show();
}
