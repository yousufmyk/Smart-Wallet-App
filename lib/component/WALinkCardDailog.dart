import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gif_view/gif_view.dart';
import 'package:wallet_app/utils/WAColors.dart';
import 'package:wallet_app/utils/WAWidgets.dart';

import '../model/cardDetailsModel.dart';
import '../screen/WADashboardScreen.dart';

class LinkCardDialog extends StatefulWidget {
  // final CreditCardModel data;
  // const LinkCardDialog({
  //   Key? key,
  //   required this.data,
  // })  : assert(data != null),
  //       super(key: key);
  static String tag = '/WAMoneyTransferCompleteDialog';

  @override
  LinkCardDialogState createState() => LinkCardDialogState(/*data: data*/);
}

class LinkCardDialogState extends State<LinkCardDialog> {
  // LinkCardDialogState({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;
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
            'https://media.istockphoto.com/id/1374485787/vector/3d-credit-card-money-financial-security-for-online-shopping-online-payment-credit-card-with.jpg?s=612x612&w=0&k=20&c=fQ_0faElpY4hqtpWWe1PuiHgpJvhy9_bVFeMZlQntvw=',
            height: 200,
            width: 200,
            fit: BoxFit.fill),

        16.height,
        Text('Sucess!', style: secondaryTextStyle()),
        16.height,
        Text('We Have Linked Your Card',
            style: boldTextStyle(size: 22), textAlign: TextAlign.center),
        8.height,

        // Text('Now you can use your card with your new PIN', style: secondaryTextStyle()),
        // 30.height,
        AppButton(
          color: WAPrimaryColor,
          width: 180,
          height: 50,
          shapeBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          text: "Back to Home",
          onTap: () {
            WADashboardScreen(
              /*data: data,*/
            ).launch(context);
          },
          textStyle: boldTextStyle(color: Colors.white),
        ),
        16.height,
      ],
    );
  }
}
