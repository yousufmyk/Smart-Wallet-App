import 'package:flutter/material.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/component/WAOperationComponent.dart';
import 'package:wallet_app/model/WalletAppModel.dart';


import '../component/WAPayToComponent.dart';
import '../main.dart';
import '../model/cardDetailsModel.dart';
import 'WABillPayScreen.dart';
import 'WACreditCardScreen.dart';
import 'WALoanScreen.dart';
import 'WARewardsScreen.dart';
import 'WARewardsTwoScreen.dart';
import 'WASendMoneyViaLoopScreen.dart';
import 'WATicketUrlScreen.dart';
import 'WAVoucherScreen.dart';

class SubsScreen extends StatefulWidget {
  final CreditCardModel data;

  //var futureList;
  const SubsScreen({
    Key? key,
    required this.data,
    //required this.futureList,
  })  : assert(data != null),
        super(key: key);

  static String tag = '/WAOperatorsScreen';

  @override
  SubsScreenState createState() => SubsScreenState(data: data);
}

class SubsScreenState extends State<SubsScreen> {
  SubsScreenState({
    required this.data,
    //required this.futureList,
  }) : assert(data != null);
  final CreditCardModel data;

  @override
  void initState() {
    super.initState();

    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  late List<WAOperationsModel> operationsList = <WAOperationsModel>[
    WAOperationsModel(
        color: Colors.redAccent,
        title: "Netflix",
        image:
            'images/mobile_banking/Screenshot_2023-02-28_145409-removebg-preview.png',
        widget: WAPayToComponent(
          /*data: data,*/
        )),
    WAOperationsModel(
        color: Colors.black,
        title: "Disney",
        image:
            "images/mobile_banking/Screenshot_2023-02-28_153549-removebg-preview (1).png",
        widget: WAPayToComponent(
         /* data: data,*/
        )),
    WAOperationsModel(
      color: Colors.blueAccent,
      title: "Amazon",
      image:
          "images/mobile_banking/Screenshot_2023-02-28_153859-removebg-preview (1).png",
      widget: WAPayToComponent(
       /* data: data, */
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Operators',
          style: boldTextStyle(color: Colors.black, size: 20),
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
        padding: EdgeInsets.only(top: 80),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                fit: BoxFit.cover)),
        child: Container(
          margin: EdgeInsets.only(top: 30),
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32), topLeft: Radius.circular(32)),
            backgroundColor: context.cardColor,
          ),
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: operationsList.map((item) {
                return Container(
                  padding:
                      EdgeInsets.only(top: 16, bottom: 8, left: 8, right: 8),
                  decoration: boxDecorationRoundedWithShadow(16,
                      backgroundColor:
                          appStore.isDarkModeOn ? cardDarkColor : white),
                  alignment: AlignmentDirectional.center,
                  width: context.width() * 0.27,
                  child: WAOperationComponent(
                    itemModel: item,
                  ),
                ).onTap(() {
                  if (item.widget != null) {
                    item.widget.launch(context);
                  }
                });
              }).toList(),
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
