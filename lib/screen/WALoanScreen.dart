import 'package:flutter/material.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/component/WAOperationComponent.dart';
import 'package:wallet_app/model/WalletAppModel.dart';


import '../main.dart';
import '../model/cardDetailsModel.dart';
import 'CarLoanIntroScreen.dart';
import 'WABillPayScreen.dart';
import 'WACreditCardScreen.dart';
//import 'WADifferentLoansScreen.dart';
import 'WAHajjUmrahLoanIntroScreen.dart';
import 'WARewardsScreen.dart';
import 'WARewardsTwoScreen.dart';
import 'WASendMoneyViaLoopScreen.dart';
import 'WATicketUrlScreen.dart';
import 'WATravelLoanIntroScreen.dart';
import 'WAVoucherScreen.dart';

class LoansScreen extends StatefulWidget {
  final CreditCardModel data;

  //var futureList;
  const LoansScreen({
    Key? key,
    required this.data,
    //required this.futureList,
  })  : assert(data != null),
        super(key: key);

  static String tag = '/WAOperatorsScreen';

  @override
  LoansScreenState createState() => LoansScreenState(data:data);
}

class LoansScreenState extends State<LoansScreen> {
  LoansScreenState({
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
    //   WAOperationsModel(
    //   color: Color(0xFF6C56F9),
    //   title: 'Transfer',
    //   image: 'images/mobile_banking/wa_transfer.png',
    //   //widget: WASendMoneyViaLoopScreen(data: data),
    //   ),
    //   WAOperationsModel(
    //   color: Color(0xFFFF7426),
    //   title: 'Vouchers',
    //   image: 'images/mobile_banking/wa_voucher.png',
    //   widget: WAVoucherScreen(),
    //   ),
    //   WAOperationsModel(
    //   color: Color(0xFF6C56F9),
    //   title: 'Top Up',
    //   image: 'images/mobile_banking/wa_ticket.png',
    //   //widget: WACreditCardScreen(data: data,),
    // ),
    //   WAOperationsModel(
    //   color: Color(0xFF26C884),
    //   title: 'Bill Pay',
    //   image: 'images/mobile_banking/wa_bill_pay.png',
    //   //widget: WABillPayScreen(/*data: data,*/),
    // ),

    WAOperationsModel(
      color: Colors.blueAccent,
      title: 'Car',
      image:
          'images/mobile_banking/Screenshot_2023-02-27_151719-removebg-preview.png',
      widget: CarLoanIntroScreen(data: data,),
      //widget: WATicketUrlScreen(),
    ),
    // WAOperationsModel(
    //   color: Color(0xFF26C884),
    //   title: 'Rewards',
    //   image: 'images/mobile_banking/Screenshot_2023-02-20_145843-removebg-preview (1).png',
    //   widget: RewardTwoScreen(),
    // ),
    WAOperationsModel(
      color: Colors.yellow,
      title: 'Hajj & Umrah Loans',
      image:
          'images/mobile_banking/Screenshot_2023-02-24_165525-removebg-preview (1).png',
      // widget: RewardTwoTestingScreen(),
      //widget: LoanIntroScreen(),
      widget: HajjUmrahLoanIntroScreen(data: data,)
    ),
    WAOperationsModel(
      color: Colors.greenAccent,
      title: 'Home',
      image:
          'images/mobile_banking/Screenshot_2023-03-24_100828-removebg-preview.png',
      // widget: RewardTwoTestingScreen(),
      //widget: LoanIntroScreen(),
      //widget: HajjUmrahLoanIntroScreen(data: data,)
    ),
    WAOperationsModel(
      color: Colors.blueAccent,
      title: 'Business',
      image:
          'images/mobile_banking/Screenshot_2023-03-24_101115-removebg-preview.png',
      // widget: RewardTwoTestingScreen(),
      //widget: LoanIntroScreen(),
      //widget: HajjUmrahLoanIntroScreen(data: data,)
    ),
   
    

    // WAOperationsModel(
    //   color: Colors.black,
    //   title: 'Education Loan',
    //   image:
    //       'images/mobile_banking/Screenshot_2023-02-24_121133-removebg-preview (1).png',
    //   //widget: NearByScreen(),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        title: Text(
          'Loans',
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
