import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// import 'package:mobile_banking/utils/widgets/slider.dart';
import 'package:slider_button/slider_button.dart';
import 'package:wallet_app/component/WASendViaComponent.dart';
import 'package:wallet_app/model/WalletAppModel.dart';
import 'package:wallet_app/screen/WATopUpReceiptScreen.dart';
import 'package:wallet_app/utils/WAColors.dart';
import 'package:wallet_app/utils/WADataGenerator.dart';
import 'package:wallet_app/utils/WAWidgets.dart';

import '../main.dart';
import '../model/cardDetailsModel.dart';

class WATopUPCardScreen extends StatefulWidget {
  // final CreditCardModel data;

  // const WATopUPCardScreen({
  //   Key? key,
  //   required this.data,
  // })  : assert(data != null),
  //       super(key: key);
  static String tag = '/WATopUPCardScreen';

  @override
  WATopUPCardScreenState createState() => WATopUPCardScreenState(/*data: data*/);
}

class WATopUPCardScreenState extends State<WATopUPCardScreen> {
  // WATopUPCardScreenState({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;
  TextEditingController amountController =
      TextEditingController(text: "500");
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  FocusNode cardFocusNode = FocusNode();
  FocusNode pinFocusNode = FocusNode();

  List<WACardModel> sendViaCardList = waSendViaCardList();
  WACardModel selectedCard = WACardModel();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    selectedCard = sendViaCardList[0];
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
          title: Text('Top Up to Card',
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
          height: context.height(),
          width: context.width(),
          padding: EdgeInsets.only(top: 60),
          decoration: BoxDecoration(
              color: context.cardColor,
              image: DecorationImage(
                  image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text('Select Card',
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
                      return Container(
                        decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: WAPrimaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(18)),
                        padding: EdgeInsets.only(
                            left: 22, right: 22, top: 8, bottom: 8),
                        child: Text('AED${amountList[index]}',
                            style: secondaryTextStyle(color: WAPrimaryColor)),
                      ).onTap(
                        () {
                          amountController.text = amountList[index]!;
                          setState(() {});
                        },
                      );
                    },
                  ),
                ).center(),
                16.height,
                Text("Card Number",
                        style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                16.height,
                AppTextField(
                  autoFocus: false,
                  decoration: waInputDecoration(
                      hint: "Enter your card number",
                      bgColor: context.cardColor,
                      borderColor: Colors.grey),
                  textFieldType: TextFieldType.NAME,
                  keyboardType: TextInputType.name,
                  controller: cardNumberController,
                  focus: cardFocusNode,
                ).paddingOnly(left: 16, right: 16),
                16.height,
                Text("Pin", style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                AppTextField(
                  autoFocus: false,
                  decoration: waInputDecoration(
                      hint: "Enter the PIN No. here",
                      bgColor: context.cardColor,
                      borderColor: Colors.grey),
                  textFieldType: TextFieldType.OTHER,
                  keyboardType: TextInputType.number,
                  controller: pinController,
                  focus: pinFocusNode,
                ).paddingOnly(left: 16, right: 16),
                16.height,
                SliderButton(
                  buttonSize: 50,
                  backgroundColor: WAPrimaryColor,
                  dismissible: true,
                  action: () {
                    WATopUpReceiptScreen(
                      card: selectedCard,
                      /*data: data,*/
                    ).launch(context);
                  },
                  label: Text("Swipe for Top Up", style: boldTextStyle()),
                  icon: Icon(Icons.arrow_forward, color: WAPrimaryColor),
                ).paddingOnly(top: 16, bottom: 16).center(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
