import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/utils/WAColors.dart';
import 'package:wallet_app/utils/WAWidgets.dart';

import '../Controllers/recipentsController.dart';
import '../model/cardDetailsModel.dart';
import '../screen/WADashboardScreen.dart';

class WAVoucherDialog extends StatefulWidget {
 
  static String tag = '/WAMoneyTransferCompleteDialog';

  @override
 WAVoucherDialogState createState() => WAVoucherDialogState();
}

class WAVoucherDialogState extends State<WAVoucherDialog> {
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
    final controller = Get.put(ReceiptsNameController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        waCommonCachedNetworkImage(
            'https://media.istockphoto.com/id/1049722234/vector/congrats-card-hand-lettering.jpg?s=612x612&w=0&k=20&c=b8KWNHjGI4yej3onYrgz20Zcb-s2Mt6bKpVDC6gEFYE=',
            height: 200,
            width: 200,
            fit: BoxFit.fill),
        16.height,
        Text('Congratulations!', style: secondaryTextStyle()),
        
        16.height,
        Text("You're now eligible for this voucher", style: boldTextStyle(size: 22), textAlign: TextAlign.center),
        8.height,
        
        AppButton(
          color: WAPrimaryColor,
          width: 180,
          height: 50,
          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          text: "Claim",
          onTap: () {
            finish(context);
          },
          textStyle: boldTextStyle(color: Colors.white),
        ),
        16.height,
      ],
    );
  }
}
