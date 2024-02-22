import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';

// import 'package:mobile_banking/utils/widgets/slider.dart';
import 'package:slider_button/slider_button.dart';
import 'package:wallet_app/component/WAMoneyTransferCompeteDialog.dart';
import 'package:wallet_app/component/WARecentPayeesComponent.dart';
import 'package:wallet_app/component/WASendViaComponent.dart';
import 'package:wallet_app/model/WalletAppModel.dart';
import 'package:wallet_app/utils/WAColors.dart';
import 'package:wallet_app/utils/WADataGenerator.dart';
import 'package:wallet_app/utils/WAWidgets.dart';

import '../Controllers/recipentsController.dart';
import '../main.dart';
import '../model/cardDetailsModel.dart';

class WASendMoneyViaLoopScreen extends StatefulWidget {
  // final CreditCardModel data;
  // const WASendMoneyViaLoopScreen({
  //   Key? key,
  //   required this.data,
  // })  : assert(data != null),
  //       super(key: key);

  // static String tag = '/WASendMoneyViaLoopScreen';

  @override
  WASendMoneyViaLoopScreenState createState() =>
      WASendMoneyViaLoopScreenState(/*data: data*/);
}

class WASendMoneyViaLoopScreenState extends State<WASendMoneyViaLoopScreen> {
  // WASendMoneyViaLoopScreenState({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;

  final controller = Get.put(ReceiptsNameController());

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
          title: Text('Send Money',
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
          height: context.mediaQuerySize.height,
          width: context.mediaQuerySize.width,
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
                Text('Send Via', style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                8.height,
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(left: 16, right: 16),
                  width: context.mediaQuerySize.width,
                  decoration: boxDecorationRoundedWithShadow(16,
                      backgroundColor: context.cardColor),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedCard,
                      items: sendViaCardList.map((item) {
                        return DropdownMenuItem<WACardModel>(
                          value: item,
                          child: WASendViaComponent(
                            item: item,
                            /*data: data,*/
                          ),
                        );
                      }).toList(),
                      onChanged: (WACardModel? value) {
                        selectedCard = value!;
                        setState(() {});
                      },
                    ),
                  ),
                ),
                16.height,
                Text('Recent Payees',
                        style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                16.height,
                WARecentPayeesComponent(
                  /*data: data,*/
                ),
                16.height,
                Text('Amount', style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                AppTextField(
                  controller: controller.newamountController,
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
                      return Container(
                        decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: WAPrimaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(18)),
                        padding: EdgeInsets.only(
                            left: 22, right: 22, top: 8, bottom: 8),
                        child: Text('AED${amountList[index]}',
                            style: secondaryTextStyle(
                                color: appStore.isDarkModeOn
                                    ? black
                                    : WAPrimaryColor)),
                      ).onTap(
                        () {
                          controller.newamountController.text =
                              amountList[index]!;
                          setState(() {});
                        },
                      );
                    },
                  ),
                ).center(),
                16.height,
                Text("Beneficiary Name",
                        style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                16.height,
                AppTextField(
                  autoFocus: false,
                  decoration: waInputDecoration(
                    hint: "Enter Beneficiary 's name here",
                    bgColor: context.cardColor,
                    borderColor: Colors.grey,
                  ),
                  textFieldType: TextFieldType.NAME,
                  keyboardType: TextInputType.name,
                  controller: controller.receiptsNameController,
                  focus: receiptNameFocusNode,
                  nextFocus: accountFocusNode,
                ).paddingOnly(left: 16, right: 16, bottom: 16),
                Text("Beneficiary Account Number",
                        style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                16.height,
                AppTextField(
                  autoFocus: false,
                  decoration: waInputDecoration(
                      hint: "Enter Beneficiary's name here",
                      bgColor: context.cardColor),
                  textFieldType: TextFieldType.NAME,
                  keyboardType: TextInputType.name,
                  controller: controller.reciverAccountNumController,
                  focus: accountFocusNode,
                ).paddingOnly(left: 16, right: 16),
                16.height,
                SliderButton(
                  
                  buttonSize: 50,
                  backgroundColor: WAPrimaryColor,
                  dismissible: true,
                  action: () {
                    ///Do something here
                    showInDialog(context, builder: (context) {
                      return WAMoneyTransferCompleteDialog(
                        /*data: data,*/
                      );
                    });
                  },
                  label: Text("Swipe for Payment", style: boldTextStyle()),
                  icon: Icon(Icons.arrow_forward, color: WAPrimaryColor),
                ).center(),
                16.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
