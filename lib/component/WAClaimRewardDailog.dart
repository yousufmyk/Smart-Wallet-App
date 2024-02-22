import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/cardDetailsModel.dart';
import '../screen/WAUploadKYCScreen.dart';
import '../utils/WAColors.dart';

import '../utils/WAWidgets.dart';

class WAClaimRewardDialog extends StatefulWidget {
 
  static String tag = '/WAClaimRewardDialog';

  @override
  WAClaimRewardDialogState createState() => WAClaimRewardDialogState();
}

class WAClaimRewardDialogState extends State<WAClaimRewardDialog> {
 
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
    return  Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            waCommonCachedNetworkImage(
                'https://media.istockphoto.com/id/1356265093/vector/birthday-party-emoji-celebrate-emoticon-happy-birthday-face-hat-emoji.jpg?s=612x612&w=0&k=20&c=cwQdbKQQaEPo1wF-TNMCOllGYY3k3pITTAt78MTWfK0=',
                height: 200,
                width: 200,
                fit: BoxFit.fill),
            
            16.height,
            Text('Congratulations !', style: secondaryTextStyle()),
            16.height,
            Text("You've sucessfully claimed your reward", style: boldTextStyle(size: 22), textAlign: TextAlign.center),
            8.height,
            
            // Text('Now you can use your card with your new PIN', style: secondaryTextStyle()),
            // 30.height,
            AppButton(
              color: WAPrimaryColor,
              width: 180,
              height: 50,
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              text: "Done",
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
