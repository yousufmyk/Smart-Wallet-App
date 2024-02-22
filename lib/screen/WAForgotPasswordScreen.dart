import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

// import 'package:mobile_banking/utils/widgets/slider.dart';
import 'package:slider_button/slider_button.dart';
import 'package:wallet_app/model/WalletAppModel.dart';
import 'package:wallet_app/utils/WADataGenerator.dart';
import 'package:wallet_app/utils/WAWidgets.dart';

import '../Controllers/ForgotPinController.dart';
import '../component/WAPinchangeSubmittedComponent.dart';
import '../main.dart';
import '../model/Api Service/Forgot Password Apis/forgotPasswordApi.dart';
import '../model/cardDetailsModel.dart';

class WAForgotPassWordScreen extends StatefulWidget {
  

  @override
  WAForgotPassWordScreenState createState() => WAForgotPassWordScreenState();
}

class WAForgotPassWordScreenState extends State<WAForgotPassWordScreen> {
  
  final controller = Get.put(ForgotPinController());

  FocusNode cvvFocusNode = FocusNode();
  FocusNode dobFocusNode = FocusNode();
  FocusNode enterCurrentPinFocusNode = FocusNode();
  FocusNode enterNewPinFocusNode = FocusNode();

  List<WACardModel> sendViaCardList = waSendViaCardList();
  WACardModel selectedCard = WACardModel();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
    selectedCard = sendViaCardList[0];
    await Future.delayed(Duration(milliseconds: 500));
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
          title: Text('New Pin',
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 60),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.height,
                Text("Enter new PIN",
                        style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                16.height,
                AppTextField(
                  autoFocus: false,
                  decoration: waInputDecoration(
                      hint: "Enter your new PIN here",
                      bgColor: context.cardColor),
                  textFieldType: TextFieldType.NAME,
                  keyboardType: TextInputType.name,
                  controller: controller.enterNewPin,
                  focus: enterCurrentPinFocusNode,
                ).paddingOnly(left: 16, right: 16),
                Text("Re-Enter New PIN",
                        style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                16.height,
                AppTextField(
                  autoFocus: false,
                  decoration: waInputDecoration(
                      hint: "Re-Enter your New PIN here",
                      bgColor: context.cardColor),
                  textFieldType: TextFieldType.NAME,
                  keyboardType: TextInputType.name,
                  controller: controller.confirmEnterNewPin,
                  focus: enterNewPinFocusNode,
                ).paddingOnly(left: 16, right: 16),
                16.height,
                ForgotPassWordApi(),
                16.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
