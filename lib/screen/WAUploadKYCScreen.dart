import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../component/WAUploadKYCComponent.dart';
import '../main.dart';
import '../utils/WAColors.dart';
import 'WALoginScreen.dart';

//this is the screen inside it there is a widget for kyc upload:

class WAKYCuploadScreen extends StatefulWidget {
//    final CreditCardModel data;

//  const WARegisterScreen({
//     Key? key,
//     required this.data,

//   })  : assert(data != null),
//         super(key: key);
  static String tag = '/WARegisterScreen';

  @override
  WAKYCuploadScreenState createState() => WAKYCuploadScreenState();
}

class WAKYCuploadScreenState extends State<WAKYCuploadScreen> {
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var mpinController = TextEditingController();
  var securityQuestionController = TextEditingController();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();
  FocusNode confirmPassWordFocusNode = FocusNode();
  FocusNode dateOfBirthFocusNode = FocusNode();
  FocusNode mpinFocusNode = FocusNode();
  FocusNode securityQuestionFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Upload your KYC',
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
        width: context.width(),
        height: context.height(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/mobile_banking/wa_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      width: context.width(),
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      margin: EdgeInsets.only(top: 55.0),
                      decoration: boxDecorationWithShadow(
                          borderRadius: BorderRadius.circular(30),
                          backgroundColor: context.cardColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                150.height,
                                WAKycUploadComponent(),
                                150.height,
                                AppButton(
                                  color: WAPrimaryColor,
                                  width: 180,
                                  height: 50,
                                  shapeBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  text: "Submit",
                                  onTap: () {
                                    // WALoginScreen().launch(context);
                                    _onAlertButtonsPressed(context);
                                  },
                                  textStyle: boldTextStyle(color: Colors.white),
                                ).paddingOnly(
                                    left: context.width() * 0.1,
                                    right: context.width() * 0.1),
                                30.height,
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

_onAlertButtonsPressed(context) {
  //final CreditCardModel data;

  Alert(
      context: context,
      //type: AlertType.warning,
      type: AlertType.success,
      title: 'Done',
      desc: 'Your KYC has been Updated',
      buttons: [
        DialogButton(
          // onPressed: () {
          //   //  WADashboardScreen(
          //   //     data: data,
          //   //   ).launch(context);
          // },
          onPressed: () => Navigator.pop(context),
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
