import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gif_view/gif_view.dart';
import 'package:wallet_app/utils/WAColors.dart';
import 'package:wallet_app/utils/WAWidgets.dart';

import '../model/cardDetailsModel.dart';
import '../screen/WADashboardScreen.dart';

class LinkBankAccountDialog extends StatefulWidget {
  // final CreditCardModel data;
  // const LinkBankAccountDialog({
  //   Key? key,
  //   required this.data,
  // })  : assert(data != null),
  //       super(key: key);
  static String tag = '/WAMoneyTransferCompleteDialog';

  @override
  LinkBankAccountDialogState createState() =>
      LinkBankAccountDialogState(/*data: data*/);
}

class LinkBankAccountDialogState extends State<LinkBankAccountDialog> {
  // LinkBankAccountDialogState({
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
            'https://media.istockphoto.com/id/1031507604/vector/bank-modern-thin-line-design-style-vector-illustration.jpg?s=612x612&w=0&k=20&c=vvptoH2ajRiQyATpZlEIjD6l6_C8Ym1WWesJ3opDoSY=',
            height: 200,
            width: 200,
            fit: BoxFit.fill),

        16.height,
        Text('Sucess!', style: secondaryTextStyle()),
        16.height,
        Text('We Have Linked Your Bank Account',
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
