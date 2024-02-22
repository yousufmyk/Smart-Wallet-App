import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Controllers/recipentsController.dart';
import '../dashboard/smart_home/models/smart_home_info_model.dart';
import '../model/WalletAppModel.dart';
import '../model/cardDetailsModel.dart';
import '../screen/WALoginScreen.dart';
import '../utils/WAColors.dart';
import '../utils/WADataGenerator.dart';
import '../utils/WAWidgets.dart';
import 'WAMoneyTransferCompeteDialog.dart';
import 'WASendViaComponent.dart';
import 'package:slider_button/slider_button.dart';

import 'WATransferViaQrDoneDailog.dart';

class LoginSendViaQrCodeScreen extends StatefulWidget {
  // final CreditCardModel data;

  // //var futureList;
  // const LoginSendViaQrCodeScreen({
  //   Key? key,
  //   required this.data,
  //   //required this.futureList,
  // })  : assert(data != null),
  //       super(key: key);

  @override
  _LoginSendViaQrCodeScreenState createState() =>
      _LoginSendViaQrCodeScreenState(/*data:data*/);
}

class _LoginSendViaQrCodeScreenState extends State<LoginSendViaQrCodeScreen> {
  // _LoginSendViaQrCodeScreenState({
  //   required this.data,
  //   //required this.futureList,
  // }) : assert(data != null);
  // final CreditCardModel data;
  final controller = Get.put(ReceiptsNameController());
  TextEditingController amountController =
      TextEditingController(text: "\u002450");
  List<SmartHomeInfoModel> setUsageHistoryDetail = getUsageHistoryList();
  List<SmartHomeInfoModel> setRoomsDetail = getRoomsInfoList();
  List<SmartHomeInfoModel> setDevicesDetail = getDevicesInfoList();

  List<WACardModel> sendViaCardList = waSendViaCardList();
  WACardModel selectedCard = WACardModel();
  FocusNode receiptNameFocusNode = FocusNode();
  FocusNode accountFocusNode = FocusNode();

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
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            
          ),
          body: Container(
            height: context.mediaQuerySize.height,
            width: context.mediaQuerySize.width,
            // padding: EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Send Via', style: boldTextStyle(size: 18, color: black))
                      .paddingLeft(16),
                  8.height,
                 
                  16.height,

                  16.height,
                  Text('Amount', style: boldTextStyle(size: 18, color: black))
                      .paddingLeft(16),
                  AppTextField(
                    controller: amountController,
                    autoFocus: false,
                    textAlign: TextAlign.center,
                    textFieldType: TextFieldType.OTHER,
                    keyboardType: TextInputType.number,
                    textStyle: TextStyle(fontSize: 22, color: black),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.5))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.5))),
                    ),
                  ).paddingOnly(left: 16, right: 16),
                  16.height,
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 16,
                    children: List.generate(
                      amountList.length,
                      (index) {
                        var appStore;
                        return Container(
                            decoration: boxDecorationWithRoundedCorners(
                                backgroundColor:
                                    WAPrimaryColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(18)),
                            padding: EdgeInsets.only(
                                left: 22, right: 22, top: 8, bottom: 8),
                            child: Text(
                              '\u0024${amountList[index]}',
                             
                            ).onTap(
                              () {
                                amountController.text = amountList[index]!;
                                setState(() {});
                              },
                            ));
                      },
                    ),
                  ).center(),
                  16.height,
                  Text("Notes", style: boldTextStyle(size: 18, color: black))
                      .paddingLeft(16),
                  16.height,
                  AppTextField(
                    autoFocus: false,
                    decoration: waInputDecoration(
                      hint: "Enter Notes here",
                      bgColor: context.cardColor,
                      borderColor: Colors.grey,
                    ),
                    textFieldType: TextFieldType.NAME,
                    keyboardType: TextInputType.name,
                    controller: controller.receiptsNameController,
                    focus: receiptNameFocusNode,
                    nextFocus: accountFocusNode,
                  ).paddingOnly(left: 16, right: 16, bottom: 16),
                 
                  ElevatedButton(
                          onPressed: () {
                            _onAlertButtonsPressed(context);
                          },
                          child: Text("Pay"))
                      .center(),
                  16.height,
                ],
              ),
            ),
          ),
        ));
  }
}

_onAlertButtonsPressed(context) {
  Alert(
      context: context,
      //type: AlertType.warning,
      type: AlertType.info,
      title: 'Please Login first',
      desc: 'Please Login to complete your transaction',
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          color: Color.fromARGB(255, 253, 250, 86),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        DialogButton(
          onPressed: () {
            WALoginScreen().launch(context);
          },
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            'Proceed',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
       
      ]).show();
}
