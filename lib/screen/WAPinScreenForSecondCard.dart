import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

// import 'package:mobile_banking/utils/widgets/slider.dart';
import 'package:slider_button/slider_button.dart';
import 'package:wallet_app/model/WalletAppModel.dart';
import 'package:wallet_app/utils/WAColors.dart';
import 'package:wallet_app/utils/WADataGenerator.dart';
import 'package:wallet_app/utils/WAWidgets.dart';

import '../component/WAPinchangeSubmittedComponent.dart';
import '../main.dart';
import '../model/cardDetailsModel.dart';

class WAPinScreenSecondCard extends StatefulWidget {
  final CreditCardModel data;
  const WAPinScreenSecondCard({
    Key? key,
    required this.data,
  })  : assert(data != null),
        super(key: key);
  static String tag = '/WASendMoneyViaLoopScreen';

  @override
  WAPinScreenSecondCardState createState() => WAPinScreenSecondCardState(data: data);
}

class WAPinScreenSecondCardState extends State<WAPinScreenSecondCard> {
  WAPinScreenSecondCardState({
    required this.data,
  }) : assert(data != null);
  final CreditCardModel data;
  TextEditingController cvvController =
      TextEditingController(/*text: "\u002450"*/);
  TextEditingController dobController = TextEditingController();
  TextEditingController enterCurrentPinController = TextEditingController();
  TextEditingController enterNewPinController = TextEditingController();

  FocusNode cvvFocusNode = FocusNode();
  FocusNode dobFocusNode = FocusNode();
  FocusNode enterCurrentPinFocusNode = FocusNode();
  FocusNode enterNewPinFocusNode = FocusNode();
  String dropdownValue = 'Date of Birth';

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
          title: Column(
            children: [
              Text('Change Pin',
                  style: boldTextStyle(color: Colors.black, size: 20)),
              Text(
                data.cardOrderInfo!.secondaryCardOrderInfo!
                  .elementAt(0)
                  .card!
                  .toUpperCase(),
              )
            ],
          ),
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
              image: DecorationImage(
                  image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                // Text("Enter CVV", style: boldTextStyle(size: 18, color: black))
                //     .paddingLeft(16),
                // 16.height,
                // AppTextField(
                //   autoFocus: false,
                //   decoration: waInputDecoration(
                //     hint: "Enter your CVV here",
                //     bgColor: context.cardColor,
                //     borderColor: Colors.grey,
                //   ),
                //   textFieldType: TextFieldType.NAME,
                //   keyboardType: TextInputType.name,
                //   controller: cvvController,
                //   focus: cvvFocusNode,

                //   ///nextFocus: accountFocusNode,
                // ).paddingOnly(left: 16, right: 16, bottom: 16),
                Text("Select how we verify you?",
                        style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                Container(
                  child: DropdownButton<String>(
                    // Step 3.
                    icon: Icon(Icons.arrow_drop_down_circle_outlined),
                    isExpanded: true,
                    disabledHint: Text("Select"),
                    //dropdownColor: Color.fromARGB(255, 99, 185, 255),

                    value: dropdownValue,
                    // Step 4.
                    items: <String>[
                      'Date of Birth',
                      'Card Expiry Date',
                      'CVV'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    }).toList(),
                    // Step 5.
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ).paddingLeft(16),
                AppTextField(
                  autoFocus: false,
                  decoration: waInputDecoration(
                      hint: "Enter your ${dropdownValue} here",
                      bgColor: context.cardColor),
                  textFieldType: TextFieldType.NAME,
                  keyboardType: TextInputType.name,
                  controller: dobController,
                  focus: dobFocusNode,
                ).paddingOnly(left: 16, right: 16),
                Text("Enter PIN", style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                16.height,
                AppTextField(
                  autoFocus: false,
                  decoration: waInputDecoration(
                      hint: "Enter your current PIN here",
                      bgColor: context.cardColor),
                  textFieldType: TextFieldType.NAME,
                  keyboardType: TextInputType.name,
                  controller: enterCurrentPinController,
                  focus: enterCurrentPinFocusNode,
                ).paddingOnly(left: 16, right: 16),
                Text("Enter New PIN",
                        style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                16.height,
                AppTextField(
                  autoFocus: false,
                  decoration: waInputDecoration(
                      hint: "Enter your New PIN here",
                      bgColor: context.cardColor),
                  textFieldType: TextFieldType.NAME,
                  keyboardType: TextInputType.name,
                  controller: enterNewPinController,
                  focus: enterNewPinFocusNode,
                ).paddingOnly(left: 16, right: 16),
                16.height,
                SliderButton(
                  buttonSize: 50,
                  backgroundColor: WAPrimaryColor,
                  dismissible: true,
                  action: () {
                    ///Do something here
                    showInDialog(context, builder: (context) {
                      return WAPinChangeSubmiteDialog(
                       /* data: data,*/
                      );
                    });
                  },
                  label: Text("Swipe to submit", style: boldTextStyle()),
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