import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/component/WASendViaComponent.dart';
import 'package:wallet_app/model/WalletAppModel.dart';
import 'package:wallet_app/utils/WAColors.dart';
import 'package:wallet_app/utils/WADataGenerator.dart';
import 'package:wallet_app/utils/WAWidgets.dart';

// import 'package:mobile_banking/utils/widgets/slider.dart';

import '../component/cardLimitsComponents/WACardATMLimitComponent.dart';
import '../component/WACardSwitchComponent.dart';
import '../component/cardLimitsComponents/WACardECOMLimitComponent.dart';
import '../component/cardLimitsComponents/WACardPOSLimitComponent.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../main.dart';
import '../model/cardDetailsModel.dart';
import '../utils/buttons/WAcardlimitSubmitButton.dart';
import 'package:slider_button/slider_button.dart';


class WACreditCardLimit extends StatefulWidget {

  final CreditCardModel data;

  const WACreditCardLimit({
    Key? key,
    required this.data,
  })  : assert(data != null),
        super(key: key);
  static String tag = '/WASendMoneyViaLoopScreen';

  @override
  WACreditCardLimitState createState() => WACreditCardLimitState(data : data);
}

class WACreditCardLimitState extends State<WACreditCardLimit> {
  WACreditCardLimitState({
    required this.data,
  }) : assert(data != null);
  final CreditCardModel data;
  TextEditingController amountController =
      TextEditingController(text: "\u002450");
  TextEditingController receiptNameController = TextEditingController();
  TextEditingController accountController = TextEditingController();

  FocusNode receiptNameFocusNode = FocusNode();
  FocusNode accountFocusNode = FocusNode();

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
          title: Text('Manage Your Card',
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
        body: Expanded(
          child: Container(
            height: context.height(),
            width: context.width(),
            padding: EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.height,
                  Text('Primary Card',
                          style: boldTextStyle(size: 18, color: black))
                      .paddingLeft(16),
                  8.height,
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(left: 16, right: 16),
                    width: context.width(),
                    decoration: boxDecorationRoundedWithShadow(16,
                        backgroundColor: context.cardColor),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedCard,
                        items: sendViaCardList.map((item) {
                          return DropdownMenuItem<WACardModel>(
                            value: item,
                            child: WASendViaComponent(item: item,/* data: data*/),
                          );
                        }).toList(),
                        onChanged: (WACardModel? value) {
                          selectedCard = value!;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  8.height,
                  Text('Card Actions',
                          style: boldTextStyle(size: 18, color: black))
                      .paddingLeft(16),
                  8.height,

                  WACardSwitchComponent(),
                  16.height,
                  Text('Card limits',
                          style: boldTextStyle(size: 18, color: black))
                      .paddingLeft(16),
                  16.height,
                  Text('ATM:', style: boldTextStyle(size: 18, color: black))
                      .paddingLeft(16),
                  16.height,
                  WACardATMLimitComponent(),
                  16.height,

                  Text('POS:', style: boldTextStyle(size: 18, color: black))
                      .paddingLeft(16),
                  16.height,
                  WACarPOSLimitComponent(),
                  16.height,

                  Text('E-COM:', style: boldTextStyle(size: 18, color: black))
                      .paddingLeft(16),
                  16.height,
                  WACarECOMLimitComponent(),
                  8.height,
                  
                  
                  SliderButton(
                    buttonSize: 50,
                    backgroundColor: WAPrimaryColor,
                    dismissible: true,
                    action: () async{
                      await _limitssubmitButttonPressedButtonsPressed(context);
                    },
                    label: Text("Swipe to submit your new limits", style: boldTextStyle()),
                    icon: Icon(Icons.arrow_forward, color: WAPrimaryColor),
                  ).center(),
                  16.height,
                  Text("Exsting Pin:",
                          style: boldTextStyle(size: 18, color: black))
                      .paddingLeft(16),
                  16.height,
                  AppTextField(
                    autoFocus: false,
                    decoration: waInputDecoration(
                      hint: "Enter Your Existing Pin here",
                      bgColor: context.cardColor,
                      borderColor: Colors.grey,
                    ),
                    textFieldType: TextFieldType.NAME,
                    keyboardType: TextInputType.name,
                    controller: receiptNameController,
                    focus: receiptNameFocusNode,
                    nextFocus: accountFocusNode,
                  ).paddingOnly(left: 16, right: 16, bottom: 16),
                  Text("New Pin", style: boldTextStyle(size: 18, color: black))
                      .paddingLeft(16),
                  16.height,
                  AppTextField(
                    autoFocus: false,
                    decoration: waInputDecoration(
                      hint: "Enter your new pin here",
                      bgColor: context.cardColor,
                      borderColor: Colors.grey,
                    ),
                    textFieldType: TextFieldType.NAME,
                    keyboardType: TextInputType.name,
                    controller: receiptNameController,
                    focus: receiptNameFocusNode,
                    nextFocus: accountFocusNode,
                  ).paddingOnly(left: 16, right: 16, bottom: 16),
                  Text("Re-enter new Pin",
                          style: boldTextStyle(size: 18, color: black))
                      .paddingLeft(16),
                  16.height,
                  AppTextField(
                    autoFocus: false,
                    decoration: waInputDecoration(
                        hint: "Re-enter your new Pin here",
                        bgColor: context.cardColor),
                    textFieldType: TextFieldType.NAME,
                    keyboardType: TextInputType.name,
                    controller: accountController,
                    focus: accountFocusNode,
                  ).paddingOnly(left: 16, right: 16),
                  16.height,
                  AppButton(
                          text: "Submit your new limits",
                          color: Color.fromARGB(255, 74, 255, 80),
                          textColor: Colors.white,
                          shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          width: MediaQuery.of(context).size.width,
                          onTap: () {
                           
                            _limitssubmitButttonPressedButtonsPressed(context);
                          })
                      .paddingOnly(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1),
                          16.height,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  _limitssubmitButttonPressedButtonsPressed(context) {
    Alert(
        context: context,
        //type: AlertType.warning,
        type: AlertType.success,
        title: 'Submitted Sucessfully',
        desc: 'Our team will review your limits and get back to you shortly',
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            color: const Color.fromRGBO(0, 179, 134, 1.0),
            child: Text(
              'OK',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          
        ]).show();
  }

  
}
