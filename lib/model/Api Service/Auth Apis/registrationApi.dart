import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../Controllers/RegistrationController.dart';
import '../../../component/WAUploadKYCdailog.dart';
import '../../../utils/WAColors.dart';
import 'package:http/http.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegistrationApi extends StatefulWidget {
   RegistrationApi({Key? key}) : super(key: key);
  

  @override
  State<RegistrationApi> createState() => _RegistrationApiState();
}

class _RegistrationApiState extends State<RegistrationApi> {
  final controller = Get.put(RegistrationController());

  Future getpostStatment() async {
    final username = controller.username.text.toString();
    final firstname = controller.firstname.text.toString();
    final lastname = controller.lastname.text.toString();
    final email = controller.emailController.text.toString();
    final number = controller.numberController.text.toString();
    final password = controller.passwordController.text.toString();
    final confirmPassword = controller.confirmPasswordController.text.toString();
    final dateOfBirth = controller.dateOfBirthController.text.toString();
    final pin = controller.pinController.text.toString();
    final securityQuestionOne = controller.securityQuestionOneController.text.toString();
    final securityQuestionTwo = controller.securityQuestionTwoController.text.toString();
    final securityQuestionThree = controller.securityQuestionThreeController.text.toString();
    
    final response = await http.post(
      Uri.parse(
          'http://sandboxdev.omaemirates.com:9502/NanoCustomerService/v1/customer/userRegistration'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        
      },
      body: jsonEncode(<String, String>{
         "instId": "OMA",
         "userName": username,
         "firstName": firstname,
         "lastName": lastname,
         "password": password,
         "pin": pin,
         "mPin": "222222",
         "mobileCountryCode": "+971",
         "mobileNumber": number,
         "emailId": email,
         "dob": dateOfBirth,
         "deviceType": "MOBILE",
         "role": "customer",
         "questionOne": "what was childhood nickName?",
         "answerOne": securityQuestionOne,
         "questionTwo": "What was the name of the first school you attended?",
         "answerTwo": securityQuestionTwo,
         "questionThree": "What was your favorite sport in high school?",
         "answerThree": securityQuestionThree
      }),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print("sucess");
      showInDialog(context, builder: (context) {
                  return WAKYCUploadDialog();
                });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Please complete All field')));
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppButton(
              text: "Register Account",
              color: WAPrimaryColor,
              textColor: Colors.white,
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              width: MediaQuery.of(context).size.width,
              onTap: () async{
                // await getpostStatment();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Your account has been sucessfully created')));
              })
          .paddingOnly(
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.1),
    );
  }
}


