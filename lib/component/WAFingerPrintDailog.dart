import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/cardDetailsModel.dart';
import '../screen/WADashboardScreen.dart';
import '../utils/WAColors.dart';
import '../utils/WAWidgets.dart';
import 'WAFingerprintComponent.dart';

class WAFingerPrintDialog extends StatefulWidget {
  final CreditCardModel data;
  const WAFingerPrintDialog({
    Key? key,
    required this.data,
  })  : assert(data != null),
        super(key: key);
  static String tag = '/WAFingerPrintDialog';

  @override
  WAFingerPrintDialogState createState() => WAFingerPrintDialogState();
}

class WAFingerPrintDialogState extends State<WAFingerPrintDialog> {
  bool isAuthenticated = false;
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
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          waCommonCachedNetworkImage(
              'https://media.istockphoto.com/id/1403252248/vector/3d-render-fingerprint-icon.jpg?s=612x612&w=0&k=20&c=l4K3nXVP0gfqogQjkxu-JZ-MgTParBanXx73MBhkwxI=',
              height: 200,
              width: 200,
              fit: BoxFit.fill),
          16.height,
          Text('Touch The FingerPrint Sensor to Proceed',
              style: boldTextStyle(size: 22), textAlign: TextAlign.center),
          30.height,
          Icon(
            Icons.fingerprint_sharp,
            size: 80,
          ),
          30.height,
          AppButton(
            color: WAPrimaryColor,
            width: 180,
            height: 50,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            text: "Proceed",
            onTap: () async {
              final emiD = await SessionManager().get("emiratesExpires");
              if (emiD == true) {
                isAuthenticated = await FingerPrintComponent().authenticate();
                if(isAuthenticated == true) {
                return _onAlertButtonsPressed(context, widget.data);}
              } else if (emiD == false)
               // isAuthenticated = await FingerPrintComponent().authenticate();
              print("Error");
              // WADashboardScreen(
              //   data: widget.data,
              // ).launch(context);
            },
            textStyle: boldTextStyle(color: Colors.white),
          ),
          16.height,
        ],
      ).center(),
    );
  }
}

_onAlertButtonsPressed(context, data) {
  //final CreditCardModel data;

  Alert(
      context: context,
      //type: AlertType.warning,
      type: AlertType.warning,
      title: 'Warning alert',
      desc: 'Your Emireates ID Is Expired Please Update you E-ID',
      buttons: [
        DialogButton(
          onPressed: () {
            WADashboardScreen(
              /*data: data,*/
            ).launch(context);
          },
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            'Ok',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        // DialogButton(
        //   onPressed: () => Navigator.pop(context),
        //   gradient: const LinearGradient(colors: [
        //     Color.fromRGBO(116, 116, 191, 1.0),
        //     Color.fromRGBO(52, 138, 199, 1.0),
        //   ]),
        //   child: const Text(
        //     'GRADIENT',
        //     style: TextStyle(color: Colors.white, fontSize: 18),
        //   ),
        // )
      ]).show();
}
