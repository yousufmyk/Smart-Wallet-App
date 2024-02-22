import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

import 'package:nb_utils/nb_utils.dart';

// import 'package:mobile_banking/utils/widgets/slider.dart';
import 'package:slider_button/slider_button.dart';
import 'package:wallet_app/model/WalletAppModel.dart';
import 'package:wallet_app/utils/WADataGenerator.dart';

import '../component/WALinkCardDailog.dart';
import '../component/WAPinchangeSubmittedComponent.dart';
import '../main.dart';
import '../model/cardDetailsModel.dart';
import '../utils/widgets/cardWidgte.dart';

class WALinkCardScreen extends StatefulWidget {
  // final CreditCardModel data;
  // const WALinkCardScreen({
  //   Key? key,
  //   required this.data,
  // })  : assert(data != null),
  //       super(key: key);
  static String tag = '/WALinkCardScreen';

  @override
  WALinkCardScreenState createState() => WALinkCardScreenState(/*data: data*/);
}

class WALinkCardScreenState extends State<WALinkCardScreen> {
  // WALinkCardScreenState({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;
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
          title: Text('Link Card',
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
              image: DecorationImage(
                  image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text("Select how we verify you?",
                        style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                CardWidget(
                  cardValue: null,
                  cvvValue: null,
                  expiryValue: null,
                  nameOnCardValue: null,
                  onpressed: () {
                    showInDialog(context, builder: (context) {
                      return LinkCardDialog(
                        /*data: data,*/
                      );
                    });
                  },
                ),
                // SliderButton(
                //   buttonSize: 50,
                //   backgroundColor: WAPrimaryColor,
                //   dismissible: true,
                //   action: () {
                //     ///Do something here
                //     showInDialog(context, builder: (context) {
                //       // return WAPinChangeSubmiteDialog(
                //       //   data: data,
                //       // );
                //     });
                //   },
                //   label: Text("Swipe to submit", style: boldTextStyle()),
                //   icon: Icon(Icons.arrow_forward, color: WAPrimaryColor),
                // ).center(),
                16.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
