import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../component/E-Id-ExpiryComponenet.dart';
import '../component/WAUploadKYCComponent.dart';
import '../main.dart';
import '../model/Api Service/Uploaded KYC Api/uploadedKycApi.dart';
import '../model/cxDetailsModel.dart';
import '../utils/WAColors.dart';
import '../utils/WAWidgets.dart';
import 'WALoginScreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//this is the screen inside it there is a widget for kyc upload:

class UploadEmiratesIdScreen extends StatefulWidget {
//    final CreditCardModel data;

//  const WARegisterScreen({
//     Key? key,
//     required this.data,

//   })  : assert(data != null),
//         super(key: key);
  static String tag = '/UploadEmiratesIdScreen';

  @override
  UploadEmiratesIdScreenState createState() => UploadEmiratesIdScreenState();
}

class UploadEmiratesIdScreenState extends State<UploadEmiratesIdScreen> {
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
  TextEditingController dateOfIsuue = TextEditingController();
  TextEditingController dateOfExp = TextEditingController();
  FocusNode dateOfIsuueFocus = FocusNode();
  FocusNode dateOfExpFoucs = FocusNode();
   String IssueDate = "";
   String ExpiryDate = "";

   _PickIssueDate() async {
    DateTime? newIssueDateTime = await showRoundedDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,

      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 20),
      lastDate: DateTime(DateTime.now().year + 50),
      fontFamily: "Mali",
      height: 150,

      //styleYearPicker: MaterialRoundedYearPickerStyle()
    );
    // YearPicker? newYear = await showYear

    print(newIssueDateTime);
    setState(() {
      dateOfIsuue = newIssueDateTime as TextEditingController;
    });
  }

   _PickExpiryDate() async {
    DateTime? newExpiryDateTime = await showRoundedDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,

      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 20),
      lastDate: DateTime(DateTime.now().year + 50),
      fontFamily: "Mali",
      height: 150,

      //styleYearPicker: MaterialRoundedYearPickerStyle()
    );
    // YearPicker? newYear = await showYear

    print(newExpiryDateTime);
    setState(() {
      ExpiryDate = newExpiryDateTime.toString();
    });
  }



  Future<CxDetailsModel> getCusData() async {
    var token = await SessionManager().get("token");
    final response = await http.get(
      Uri.parse(
          'http://sandboxdev.omaemirates.com:9502/NanoCustomerService/v1/customer/getCustomerInfo/OMA/0000000000866'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print("GetCxDetails Api Working Fine");
      return CxDetailsModel.fromJson(data);
    } else {
      print("GetCxDetails Api Not Working");
      return CxDetailsModel.fromJson(data);
    }
  }

  //  pickIssueDate() async {
  //   DateTime? IssueDate = await showRoundedDatePicker(
  //     context: context,
  //     initialDatePickerMode: DatePickerMode.day,

  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(DateTime.now().year - 20),
  //     lastDate: DateTime(DateTime.now().year + 50),
  //     fontFamily: "Mali",
  //     height: 150,

  //     //styleYearPicker: MaterialRoundedYearPickerStyle()
  //   );
  //   // YearPicker? newYear = await showYear

  //   print(IssueDate);
  //   setState(() {
  //     data = newDateTime.toString();
  //   });
  // }


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
        title: Text('Upload your E-ID',
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
                              // FutureBuilder(
                              //   future: _onChanged(),
                              //   builder: (context,snapshot){
                              //     return Visibility(child: Container(
                              //       child: ,
                              //     ))
                              //   }),
                              // _onChanged(context),
                              //150.height,
                              UplaodedKycApiService(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.warning_rounded,
                                    color: Colors.redAccent,
                                  ),
                                  Text("Your Emirates ID is Expired",
                                      style: boldTextStyle(size: 14)),
                                ],
                              ),

                              10.height,
                              WAKycUploadComponent(),
                              10.height,
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Issue Date",
                                      style: boldTextStyle(size: 14))),

                              GestureDetector(
                                onTap: ()async{
                                 await  _PickIssueDate();
                                },
                                child: AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'DD-MM-YYYY',
                                      prefixIcon: Icons.date_range_outlined),
                                  textFieldType: TextFieldType.EMAIL,
                                  keyboardType: TextInputType.number,
                                  controller: dateOfIsuue,
                                  focus: dateOfIsuueFocus,
                                  nextFocus: dateOfExpFoucs,
                                ),
                              ),
                              5.height,
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Expiry Date",
                                      style: boldTextStyle(size: 14))),
                              GestureDetector(
                                onTap: () async{
                                    
                                },
                                child: AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'DD-MM-YYYY',
                                      prefixIcon: Icons.date_range_outlined),
                                  textFieldType: TextFieldType.EMAIL,
                                  keyboardType: TextInputType.number,
                                  controller: dateOfIsuue,
                                  focus: dateOfExpFoucs,
                                  //nextFocus: dateOfExpFoucs,
                                ),
                              ),
                              //ExpiryTextFeilds(),
                              50.height,

                              AppButton(
                                color: WAPrimaryColor,
                                width: 180,
                                height: 50,
                                shapeBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                text: "Submit",
                                onTap: () {
                                  //WALoginScreen().launch(context);
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
    ));
  }
}

//  _onChanged(BuildContext context) async {
//   bool status = false;
//     bool user = await SessionManager().get("emiratesExpires");
//     return if (user == true) {
//       setState(() {
//         status = true;
//         Get.snackbar(
//           "Warning!",
//           "Please Update your emirates ID",
//           backgroundColor: Colors.redAccent,
//           colorText: Color.fromARGB(255, 255, 255, 255),
//           snackPosition: SnackPosition.TOP,
//         );
//         // print("hello");
//         // print(user.toString());
//       });
//     } else {
//       setState(() {
//         status = false;
//       });
//     }
//   }

//   void setState(Null Function() param0) {
//   }

_onAlertButtonsPressed(context) {
  //final CreditCardModel data;

  Alert(
      context: context,
      //type: AlertType.warning,
      type: AlertType.success,
      title: 'Done',
      desc: 'Your Emirates Id has been Updated',
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

