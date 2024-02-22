import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/component/WACardComponent.dart';
import 'package:wallet_app/component/WATransactionComponent.dart';
import 'package:wallet_app/model/WalletAppModel.dart';
import 'package:wallet_app/utils/WAColors.dart';
import 'package:wallet_app/utils/WADataGenerator.dart';
import 'package:wallet_app/utils/WAWidgets.dart';


import '../component/WARecentPayeesComponent.dart';
import '../component/WARecentPayeesWalletComponent.dart';
import '../component/WASendViaWalletScreen.dart';
import '../dashboard/limit_fragment.dart';
import '../model/cardDetailsModel.dart';
import 'WASendMoneyViaLoopScreen.dart';

class WAWalletScreen extends StatefulWidget {
  // final CreditCardModel data;

  // const WAWalletScreen({
  //   Key? key,
  //   required this.data,
  // })  : assert(data != null),
  //       super(key: key);
  static String tag = '/WAWalletScreen';

  @override
  WAWalletScreenState createState() => WAWalletScreenState(/*data: data*/);
}

class WAWalletScreenState extends State<WAWalletScreen> {
  // WAWalletScreenState({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;
  List<WAWalletUserModel> walletUserList = waWalletUserList();
  List<WACardModel> walletList = waCardList();
  List<WATransactionModel> transactionList = waTransactionList();

  PageController? pageController;
  int currentPosition = 1;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    pageController =
        PageController(initialPage: currentPosition, viewportFraction: 0.8);
  }

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
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Wallets',
              style: boldTextStyle(color: Colors.black, size: 20)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          //brightness: Brightness.dark,
          actions: [
            Container(
              height: 35,
              width: 35,
              margin: EdgeInsets.only(right: 16, top: 16),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              decoration: boxDecorationRoundedWithShadow(8,
                  backgroundColor: context.cardColor),
              child: waCommonCachedNetworkImage(
                  'images/mobile_banking/wa_add_icon.png',
                  fit: BoxFit.cover),
            ),
          ],
        ),
        body: Container(
          height: context.height(),
          width: context.width(),
          padding: EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: context.width(),
                  child: PageView(
                    controller: pageController,
                    children: walletList.map((WACardModel item) {
                      return WACardComponent(
                        cardModel: item,
                        /*data: data,*/
                      ).paddingOnly(right: 16);
                    }).toList(),
                    onPageChanged: (index) {
                      setState(() {
                        currentPosition = index;
                      });
                    },
                  ),
                ),
                8.height,
                DotsIndicator(
                  dotsCount: 3,
                  position: currentPosition,
                  decorator: DotsDecorator(
                      size: Size.square(9.0),
                      activeSize: Size(18.0, 9.0),
                      color: grey,
                      activeColor: WAPrimaryColor,
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                ),
                24.height,
                Align(
                        alignment: Alignment.topLeft,
                        child: Text('Send Money to',
                            style: boldTextStyle(size: 20, color: black)))
                    .paddingLeft(16),
                16.height,
                WARecentWalletPayeesComponent(
                  /*data: data,*/
                ).onTap(() {
                  SendWalletFragment(/*: data*/).launch(context);
                }),
                16.height,
                Align(
                        alignment: Alignment.topLeft,
                        child: Text('Transactions',
                            style: boldTextStyle(size: 20, color: black)))
                    .paddingLeft(16),
                16.height,
                Column(
                  children: transactionList.map((transactionItem) {
                    return WATransactionComponent(
                        transactionModel: transactionItem);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
