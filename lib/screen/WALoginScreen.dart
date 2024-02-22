import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/screen/WARegisterScreen.dart';
import 'package:wallet_app/utils/WAColors.dart';
import 'package:wallet_app/utils/WAWidgets.dart';


import '../Controllers/LogInController.dart';
import '../component/WAFingerprintComponent.dart';
import '../component/WAOperationComponent.dart';
import '../main.dart';
import '../model/Api Service/Auth Apis/loginApi.dart';
import '../model/WalletAppModel.dart';
import '../model/cardDetailsModel.dart';
import 'WACreditCardScreen.dart';
import 'WAEditProfileScreen.dart';
import 'WAIntroScreenNew.dart';
import 'WALoginScreenFeatureScreen.dart';
import 'WAOtpEnterScreen.dart';
import 'WASendMoneyViaLoopScreen.dart';
import 'WAVoucherScreen.dart';
import 'package:http/http.dart' as http;

class WALoginScreen extends StatefulWidget {
  static String tag = '/WALoginScreen';

  @override
  WALoginScreenState createState() => WALoginScreenState(/*data:data*/);
}

class WALoginScreenState extends State<WALoginScreen> {
  final emailController = TextEditingController();
  var passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();
  final newcontroller = Get.put(LoginController());
  bool showBiometrics = false;
  bool isAuthenticated = false;
  // var val = SessionManager().set("userr", "hello");

  bool status = true;

  _onChanged() async {
    bool user = await SessionManager().containsKey("userdata");
    if (user == false) {
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

  Future sendOtp() async {
    var userName = await SessionManager().get("userdata");
    // final optToVerify = controller.otp.text.toString();
    final response = await http.post(
      Uri.parse(
          'http://sandboxdev.omaemirates.com:9502/NanoCustomerService/v1/mobileOtp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "instId": "OMA",
        "userName": userName,
        "custId": "0000000000111"
      }),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return {print("Sucess")};
    } else {
      return {print("there is some error")};
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  isBiometricAvailable() async {
    // showBiometrics = await FingerPrintComponent().hasEnrolledBiometics();
    setState(() {});
  }

  Future<void> init() async {}

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
    final _controller = Get.put(LoginController());
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            //color: Color(0xffF1F2F8),
            image: DecorationImage(
                image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              50.height,
              // Text("Log In", style: boldTextStyle(size: 24, color: black)),
              Container(
                margin: EdgeInsets.all(16),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      margin: EdgeInsets.only(top: 55.0),
                      decoration: boxDecorationWithShadow(
                          borderRadius: BorderRadius.circular(30),
                          backgroundColor: context.cardColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //ElevatedButton(onPressed: _remove, child: Text('Remove')),
                                FutureBuilder(
                                    future: _onChanged(),
                                    builder: (context, snapshot) {
                                      return Align(
                                        //alignment: Alignment.centerRight,
                                        child: Visibility(
                                            maintainSize: false,
                                            maintainAnimation: true,
                                            maintainState: true,
                                            visible: status,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 20),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 150,
                                                  ),
                                                  Text("Enter User Name",
                                                      style: boldTextStyle(
                                                          size: 14)),
                                                  8.height,
                                                  AppTextField(
                                                    decoration: waInputDecoration(
                                                        hint:
                                                            'Enter your User Name here',
                                                        prefixIcon: Icons.person),
                                                    textFieldType:
                                                        TextFieldType.EMAIL,
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    controller: _controller.email,
                                                    focus: emailFocusNode,
                                                    nextFocus: passWordFocusNode,
                                                  ),
                                                ],
                                              ),
                                            )),
                                      );
                                    }),

                                16.height,

                                Text("Enter your PIN",
                                        style: boldTextStyle(size: 14))
                                    .center(),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                    hint: 'Enter your PIN here',
                                    prefixIcon: Icons.lock_outline,
                                  ),
                                  suffixIconColor: WAPrimaryColor,
                                  textFieldType: TextFieldType.PASSWORD,
                                  isPassword: true,
                                  expands: false,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: _controller.password,
                                  focus: passWordFocusNode,
                                ) /*.paddingOnly(right: 80)*/,
                                // Align(
                                //   alignment: Alignment.topRight,

                                //   child: IconButton(onPressed: (){}, icon: Icon(Icons.fingerprint))),
                                16.height,
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () async {
                                      await sendOtp();
                                      WAOTpEnterScreen().launch(context);
                                    },
                                    child: Text("Forgot PIN?",
                                        style: primaryTextStyle()),
                                  ),
                                ),
                                16.height,
                                LoginApiService(/*data: data,*/),
                                // 10.height,
                                // ElevatedButton(onPressed: (){
                                //   WAIntroScreen().launch(context);
                                // }, child: Text("Press")),
                                20.height,
                                if (showBiometrics)
                                  ElevatedButton(
                                      onPressed: () async {
                                        isAuthenticated =
                                            await FingerPrintComponent()
                                                .authenticate();
                                        setState(() {});
                                      },
                                      child: Text('Fingerprint Login')),
                                if (isAuthenticated)
                                  Text("Helloworld",
                                      style: TextStyle(color: Colors.black)),
                                // Container(
                                //   width: 200,
                                //   child: Row(
                                //     children: [
                                //       Divider(thickness: 2).expand(),
                                //       8.width,
                                //       Text('Our Services',
                                //           style: boldTextStyle(
                                //               size: 16, color: Colors.grey)),
                                //       8.width,
                                //       Divider(thickness: 2).expand(),
                                //     ],
                                //   ),
                                // ).center(),
                                // WALoginFeatureScreen(),
                                10.height,
                                Container(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Divider(thickness: 2).expand(),
                                      8.width,
                                      Text('Or login with',
                                          style: boldTextStyle(
                                              size: 16, color: Colors.grey)),
                                      8.width,
                                      Divider(thickness: 2).expand(),
                                    ],
                                  ),
                                ).center(),
                                // 30.height,
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration:
                                          boxDecorationRoundedWithShadow(16,
                                              backgroundColor:
                                                  context.cardColor),
                                      padding: EdgeInsets.all(16),
                                      child: Image.asset(
                                          'images/mobile_banking/wa_facebook.png',
                                          width: 40,
                                          height: 40),
                                    ),
                                    30.width,
                                    Container(
                                      decoration:
                                          boxDecorationRoundedWithShadow(16,
                                              backgroundColor:
                                                  context.cardColor),
                                      padding: EdgeInsets.all(16),
                                      child: Image.asset(
                                          'images/mobile_banking/wa_google_logo.png',
                                          width: 40,
                                          height: 40),
                                    ),
                                  ],
                                ).center(),
                                30.height,
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Don\'t have an account?',
                                        style: primaryTextStyle(
                                            color: Colors.grey)),
                                    4.width,
                                    Text('Register here',
                                        style: boldTextStyle(
                                            color: appStore.isDarkModeOn
                                                ? white
                                                : black)),
                                  ],
                                ).onTap(() {
                                  WARegisterScreen().launch(context);
                                }).center(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      height: 230,
                      width: 300,
                      // decoration: boxDecorationRoundedWithShadow(30,
                      //     backgroundColor: context.cardColor),
                      child: Image.asset(
                        "images/mobile_banking/otp-security.png",
                        //color: WAPrimaryColor,
                        //color: Gradient(colors: ),
                        height: 220,
                        width: 280,
                        //color: appStore.isDarkModeOn ? white : black,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              16.height,
            ],
          ),
        ),
      ),
    );
  }
}
