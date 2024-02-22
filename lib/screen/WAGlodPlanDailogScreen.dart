import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/screen/WADashboardScreen.dart';
import 'package:wallet_app/utils/WAColors.dart';
import 'package:wallet_app/utils/WAWidgets.dart';


import '../model/cardDetailsModel.dart';

class GlodPlanSeletedDialog extends StatefulWidget {
  final CreditCardModel data;
  const GlodPlanSeletedDialog({
    Key? key,
    required this.data,
    
  })  : assert(data != null),
        super(key: key);
  static String tag = '/WAPaymentCompletedDialog';

  @override
  GlodPlanSeletedDialogState createState() => GlodPlanSeletedDialogState(data: data);
}

class GlodPlanSeletedDialogState extends State<GlodPlanSeletedDialog> {
 GlodPlanSeletedDialogState({
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
        waCommonCachedNetworkImage('https://media.istockphoto.com/id/1367070716/vector/tick-mark-approved-with-shield-icon.jpg?s=612x612&w=0&k=20&c=sux2h6v_lKNQIj5Ump9lGo2PRKUdP4h2ppuFOQj95NA=', height: 200, width: 200, fit: BoxFit.fill),
        16.height,
        Text('Done!', style: secondaryTextStyle()),
        16.height,
        Text("You've Selected Gold Plan", style: boldTextStyle(size: 22)),
        8.height,
        createRichText(list: [
         
        ], textAlign: TextAlign.center),
        
        30.height,
        AppButton(
          color: WAPrimaryColor,
          width: 180,
          height: 50,
          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          text: "Back to Home",
          onTap: () {
            WADashboardScreen(/*data: data,*/).launch(context, isNewTask: true);
          },
          textStyle: boldTextStyle(color: Colors.white),
        ),
        16.height,
      ],
    );
  }
}
