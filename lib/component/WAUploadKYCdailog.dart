import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/cardDetailsModel.dart';
import '../screen/WAUploadKYCScreen.dart';
import '../utils/WAColors.dart';
import '../utils/WAWidgets.dart';

class WAKYCUploadDialog extends StatefulWidget {
 
  static String tag = '/WAMoneyTransferCompleteDialog';

  @override
  WAKYCUploadDialogState createState() => WAKYCUploadDialogState();
}

class WAKYCUploadDialogState extends State<WAKYCUploadDialog> {
 
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
            'https://media.istockphoto.com/id/1301573405/vector/kyc-or-know-your-customer-with-business-verifying-the-identity-of-its-clients-concept-at-the.jpg?s=612x612&w=0&k=20&c=7djJrV7agzj5VhLLesSZI5fZZNOWigpBj889059SROE=',
            height: 200,
            width: 200,
            fit: BoxFit.fill),
        
        16.height,
        Text('Registration Done!', style: secondaryTextStyle()),
        16.height,
        Text('Please Upload your KYC to proceed', style: boldTextStyle(size: 22), textAlign: TextAlign.center),
        8.height,
        
        // Text('Now you can use your card with your new PIN', style: secondaryTextStyle()),
        // 30.height,
        AppButton(
          color: WAPrimaryColor,
          width: 180,
          height: 50,
          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          text: "Proceed",
          onTap: () {
            WAKYCuploadScreen().launch(context);
          },
          textStyle: boldTextStyle(color: Colors.white),
        ),
        16.height,
      ],
    );
  }
}
