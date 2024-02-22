import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import 'package:nb_utils/nb_utils.dart';

import 'package:http/http.dart' as http;
import 'package:showcaseview/showcaseview.dart';
import 'package:wallet_app/component/WACardComponent.dart';
import 'package:wallet_app/component/WAOperationComponent.dart';
import 'package:wallet_app/component/WATransactionComponent.dart';
import 'package:wallet_app/model/WalletAppModel.dart';
import 'package:wallet_app/screen/WAOperatorsScreen.dart';
import 'package:wallet_app/utils/WADataGenerator.dart';

import '../component/WACardComponent2.dart';

// import '../component/WAPdfViewcomponent.dart';
import '../component/WAShowCaseComponent.dart';
import '../model/cardDetailsModel.dart';

import 'WABillPayScreen.dart';
import 'WACouponScreen.dart';
import 'WACreditCardScreen.dart';
import 'WAMyProfileScreen.dart';
import 'WANotificationScreen.dart';
import 'WARewardsScreen.dart';
import 'WASendMoneyViaLoopScreen.dart';
import 'WAVoucherScreen.dart';
import 'package:dio/dio.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

class mainScreen extends StatefulWidget {
  // final CreditCardModel? data;
  // const mainScreen({
  //   Key? key,
  //   this.data,
  // })  : assert(data != null),
  //       super(key: key);
  @override
  State<mainScreen> createState() => _mainScreenState(/*data: data!*/);
}

class _mainScreenState extends State<mainScreen> {
  // _mainScreenState({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;
  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
        builder: Builder(builder: (context) => WAHomeScreen(/*data: data*/)));
  }
}

class WAHomeScreen extends StatefulWidget {
  static String tag = '/WAHomeScreen';
  // final CreditCardModel? data;

  // const WAHomeScreen({
  //   Key? key,
  //   this.data,
  // })  : assert(data != null),
  //       super(key: key);

  @override
  WAHomeScreenState createState() => WAHomeScreenState(/*data: data!*/);
}

class WAHomeScreenState extends State<WAHomeScreen> {
  // WAHomeScreenState({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;
  List<WACardModel> cardList = waCardList();
  List<WACardModel2> cardList2 = waCardList2();
  //List<WAOperationsModel> operationsList = waOperationList();
  List<WATransactionModel> transactionList = waTransactionList();

  late List<WAOperationsModel> operationsList = <WAOperationsModel>[
    WAOperationsModel(
      color: Color(0xFF6C56F9),
      title: 'Transfer',
      image:
          'images/mobile_banking/Screenshot_2023-03-21_100553-removebg-preview (2).png',
      widget: WASendMoneyViaLoopScreen(/*data: data*/),
    ),
    WAOperationsModel(
      color: Color(0xFFFF7426),
      title: 'Vouchers',
      image:
          'images/mobile_banking/Screenshot_2023-03-21_101200-removebg-preview (1).png',
      widget: WAVoucherScreen(
        /*data: data,*/
      ),
    ),
    WAOperationsModel(
      color: Color(0xFF6C56F9),
      title: 'Top Up Card',
      image:
          'images/mobile_banking/Screenshot_2023-03-21_101442-removebg-preview (1).png',
      widget: WACreditCardScreen(
        /*data: data,*/
      ),
    ),
    WAOperationsModel(
      color: Color(0xFF6C56F9),
      title: 'Link Bank',
      image:
          'images/mobile_banking/Screenshot_2023-03-20_120405-removebg-preview.png',
      // widget: WACreditCardScreen(
      //   data: data,
      // ),
    ),
    WAOperationsModel(
      color: Color(0xFF6C56F9),
      title: 'Link Card',
      image:
          'images/mobile_banking/Screenshot_2023-03-20_120213-removebg-preview.png',
      // widget: WACreditCardScreen(
      //   data: data,
      // ),
    ),
    WAOperationsModel(
      color: Color(0xFF26C884),
      title: 'Bill Pay',
      image:
          'images/mobile_banking/Screenshot_2023-03-21_104855-removebg-preview (1).png',
      widget: WABillPayScreen(
        /*data: data,*/
      ),
    ),
    WAOperationsModel(
        color: Color(0xFFFF7426),
        title: 'Coupons',
        image:
            'images/mobile_banking/Screenshot_2023-03-21_105251-removebg-preview (1).png',
        widget: WACouoponScreen()),
  ];

  // Future<void> printDoc() async {
  //   final doc = pw.Document();
  //   doc.addPage(pw.Page(
  //       pageFormat: PdfPageFormat.a4,
  //       build: (pw.Context context) {
  //         return pw.Text("Hello World");
  //       }));
  //   await Printing.layoutPdf(
  //       onLayout: (PdfPageFormat format) async => doc.save());
  // }

  final GlobalKey globalKeyOne = GlobalKey();
  final GlobalKey globalKeyTwo = GlobalKey();
  final GlobalKey globalKeyThree = GlobalKey();
  final GlobalKey globalKeyFour = GlobalKey();
  PageController? pageController;
  int currentPosition = 1;

  @override
  void initState() {
    super.initState();
    init();
  }

  // Future<void> init() async {
  //   //
  // }
  init() async {
    pageController =
        PageController(initialPage: currentPosition, viewportFraction: 1);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: context.height(),
            width: context.width(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    50.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            
                            
                            // WAMyProfileScreen(data: data).launch(context);
                            ShowCaseWidget.of(context).startShowCase([
                              globalKeyOne,
                              globalKeyTwo,
                              globalKeyThree,
                              globalKeyFour
                            ]);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: boxDecorationWithRoundedCorners(
                              backgroundColor: context.cardColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2)),
                            ),
                            child: Icon(Icons.person),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: context.cardColor,
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.2)),
                          ),
                          alignment: Alignment.center,
                          child: ShowCaseView(
                            title: 'Notifications',
                            description: 'All your notification appear here.',
                            globalKey: globalKeyOne,
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      WANotificationScreen().launch(context);
                                    },
                                    child: Icon(Icons.add_alert,
                                        color: Colors.grey)),
                                Positioned(
                                  top: 3,
                                  right: 3,
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFF7426),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ).paddingOnly(left: 16, right: 16, bottom: 16),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Wrap(
                            direction: Axis.horizontal,
                            spacing: 16,
                            children: cardList.map((cardItem) {
                              return ShowCaseView(
                                globalKey: globalKeyTwo,
                                description:
                                    "All of your Credit/Debit card appers here",
                                title: "Cards",
                                shapeBorder: CircleBorder(),
                                child: WACardComponent(
                                    cardModel: cardItem, /*data: widget.data!)*/)
                              );
                            }).toList(),
                          ).paddingAll(16),
                          Wrap(
                            direction: Axis.horizontal,
                            spacing: 16,
                            children: cardList2.map((cardItem2) {
                              return WACardComponent2(
                                  cardModel2: cardItem2, /*data: widget.data!*/);
                            }).toList(),
                          ).paddingAll(16),
                        ],
                      ),
                    ),
                    16.height,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: [
                        Text('Operations',
                            style: boldTextStyle(size: 20, color: black)),
                        Icon(Icons.play_arrow, color: Colors.grey).onTap(() {
                          WAOperatorsScreen(
                            /*data: data,*/
                          ).launch(context);
                        }),
                      ],
                      
                    ).paddingOnly(left: 16, right: 16),
                    ShowCaseView(
                      globalKey: globalKeyThree,
                      title: "Our Services",
                      description:
                          "All of the application features appears here ",
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 16,
                          children: operationsList.map((operationModel) {
                            return WAOperationComponent(
                                    itemModel: operationModel)
                                .onTap(() {
                              operationModel.widget != null
                                  ? operationModel.widget.launch(context)
                                  : toast(operationModel.title);
                            });
                          }).toList(),
                        ).paddingAll(16),
                      ),
                    ),
                    16.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Transactions',
                            style: boldTextStyle(size: 20, color: black)),
                        Icon(Icons.play_arrow, color: Colors.grey).onTap(() {}),
                      ],
                    ).paddingOnly(left: 16, right: 16),
                    //_EndButton(context),
                    16.height,
                    ShowCaseView(
                      globalKey: globalKeyFour,
                      title: "Transaction History",
                      description:
                          "All of your Transaction History appears here ",
                      child: Column(
                        children: transactionList.map((transactionItem) {
                          return WATransactionComponent(
                              transactionModel: transactionItem);
                        }).toList(),
                      ).paddingOnly(bottom: 16),
                    ),
                  ],
                ),
              ),
            )));
  }
}
