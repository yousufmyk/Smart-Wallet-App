


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Controllers/recipentsController.dart';
import '../main.dart';
import '../model/WalletAppModel.dart';
import '../model/cardDetailsModel.dart';
import '../utils/WADataGenerator.dart';

class WARewardScreen extends StatefulWidget {
  final CreditCardModel data;
  const WARewardScreen({
    Key? key,
    required this.data,
  })  : assert(data != null),
        super(key: key);

   static String tag = '/WARewardScreen';

  @override
  WARewardScreenState createState() =>
      WARewardScreenState(data: data);
}

class WARewardScreenState extends State<WARewardScreen> {
  WARewardScreenState({
    required this.data,
  }) : assert(data != null);
  final CreditCardModel data;

  

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
          title: Text('Pay',
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
            padding:  EdgeInsets.only(top: 160),
            child: Column(
              
              children: [
                ElevatedButton(onPressed: (

                  
                ){

                }, 
                child: Text('Pay'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
