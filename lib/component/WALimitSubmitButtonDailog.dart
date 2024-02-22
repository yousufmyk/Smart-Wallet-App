



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/cardDetailsModel.dart';
import '../screen/WADashboardScreen.dart';
import '../utils/WAColors.dart';
import '../utils/WAWidgets.dart';

class WAPinChangeSubmiteDialog extends StatefulWidget {
  final CreditCardModel data;
  const WAPinChangeSubmiteDialog({
    Key? key,
    required this.data,
    
  })  : assert(data != null),
        super(key: key);
   
  static String tag = '/WAMoneyTransferCompleteDialog';

  @override
  WAPinChangeSubmiteDialogState createState() => WAPinChangeSubmiteDialogState(data:data);
}

class WAPinChangeSubmiteDialogState extends State<WAPinChangeSubmiteDialog> {

  WAPinChangeSubmiteDialogState({
    required this.data,
  }) : assert(data != null);
  final CreditCardModel data;
  
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        waCommonCachedNetworkImage(
            'https://media.istockphoto.com/id/1413221949/photo/smartphone-mobile-phone-with-credit-card-coins-and-shield-on-pink-background-online-shopping.jpg?s=612x612&w=0&k=20&c=xzctbABfzQV9REXwKKAHHXTON7mWY4Q_0_BkuFqDwAk=',
            height: 200,
            width: 200,
            fit: BoxFit.fill),
        
        16.height,
        Text('Sucess!', style: secondaryTextStyle()),
        16.height,
        Text('Your Limit Has been updated', style: boldTextStyle(size: 22), textAlign: TextAlign.center),
        8.height,
        
        // Text('Now you can use your card with your new PIN', style: secondaryTextStyle()),
        30.height,
        AppButton(
          color: WAPrimaryColor,
          width: 180,
          height: 50,
          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          text: "Back to Home",
          onTap: () {
            WADashboardScreen(/*data: data,*/).launch(context);
          },
          textStyle: boldTextStyle(color: Colors.white),
        ),
        16.height,
      ],
    );
  }
}
