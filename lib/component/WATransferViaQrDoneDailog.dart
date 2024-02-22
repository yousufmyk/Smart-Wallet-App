import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/cardDetailsModel.dart';
import '../screen/WADashboardScreen.dart';
import '../utils/WAColors.dart';
import '../utils/WAWidgets.dart';

class WAQrMoneyTransferCompleteDialog extends StatefulWidget {
  // final CreditCardModel data;
  // const WAQrMoneyTransferCompleteDialog({
  //   Key? key,
  //   required this.data,
    
  // })  : assert(data != null),
  //       super(key: key);
  static String tag = '/WAMoneyTransferCompleteDialog';

  @override
  WAQrMoneyTransferCompleteDialogState createState() => WAQrMoneyTransferCompleteDialogState();
}

class WAQrMoneyTransferCompleteDialogState extends State<WAQrMoneyTransferCompleteDialog> {
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
            'https://media.istockphoto.com/vectors/online-payment-service-banking-or-money-transfer-with-mobile-app-and-vector-id1152615463?k=20&m=1152615463&s=612x612&w=0&h=BoT8RNVKIw1YC_3yhXv-5wrVxXM9NmoaZJx_CKG_3zw=',
            height: 200,
            width: 200,
            fit: BoxFit.fill),
        16.height,
        Text('Done!', style: secondaryTextStyle()),
        16.height,
        Text('Your payment has been done', style: boldTextStyle(size: 22), textAlign: TextAlign.center),        
        30.height,
        AppButton(
          color: WAPrimaryColor,
          width: 180,
          height: 50,
          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          text: "Back to Home",
          onTap: () {
            WADashboardScreen(/*data: widget.data,*/).launch(context);
          },
          textStyle: boldTextStyle(color: Colors.white),
        ),
        16.height,
      ],
    );
  }
}
