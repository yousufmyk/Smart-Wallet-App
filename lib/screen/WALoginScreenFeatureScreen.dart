import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/component/WAOperationComponent.dart';
import 'package:wallet_app/model/WalletAppModel.dart';


import '../main.dart';
import '../model/cardDetailsModel.dart';
import 'WABillPayScreen.dart';
import 'WACreditCardScreen.dart';
import 'WAE-commerceScreen.dart';
import 'WALoginQrScannerScreen.dart';
import 'WARewardsScreen.dart';
import 'WASendMoneyViaLoopScreen.dart';
import 'WATicketUrlScreen.dart';
import 'WAVoucherScreen.dart';

class WALoginFeatureScreen extends StatefulWidget {
  

  static String tag = '/WAOperatorsScreen';

  @override
  WALoginFeatureScreenState createState() => WALoginFeatureScreenState();
}

class WALoginFeatureScreenState extends State<WALoginFeatureScreen> {
 
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
    color: Color(0xFF6C56F9),
    title: 'Quick Pay',
    image: 'images/mobile_banking/wa_transfer.png',
   widget: WALoginQrScannerScreen(),
    ),
    WAOperationsModel(
    color: Color(0xFFFF7426),
    title: 'Tickets',
    image: 'images/mobile_banking/wa_voucher.png',
    widget: WATicketUrlScreen(),
    ),
    WAOperationsModel(
    color: Color(0xFF6C56F9),
    title: 'Shopping',
    image: 'images/mobile_banking/wa_clothes.png',
    widget:WAEcommerceScreen(),
  ),
 
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
       
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
              spacing: -7,
              runSpacing: 16,
              alignment: WrapAlignment.spaceEvenly,
              children: operationsList.map((item) {
                return Container(
                  //padding:
                      //EdgeInsets.only(top: 16, bottom: 8, left: 8, right: 8),
                  decoration: boxDecorationRoundedWithShadow(16,
                      backgroundColor:
                          appStore.isDarkModeOn ? cardDarkColor : white),
                  alignment: AlignmentDirectional.center,
                 width: MediaQuery.of(context).size.width * 0.27,
                  child: WAOperationComponent(
                    itemModel: item,
                  )).onTap(() {
                  if (item.widget != null) {
                    item.widget.launch(context);
                  }
                });
              }).toList(),
            ).paddingAll(0),
          ),
        ),
      );
  }
}
