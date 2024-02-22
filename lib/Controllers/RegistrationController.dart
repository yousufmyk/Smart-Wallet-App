import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {

  final username = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final emailController = TextEditingController();
  final   numberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final pinController = TextEditingController();
  final   securityQuestionOneController = TextEditingController();
  final   securityQuestionTwoController = TextEditingController();
  final   securityQuestionThreeController = TextEditingController();

RxBool isChecked = false.obs;





@override
  void dispose() {
    username.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    dateOfBirthController.dispose();
    pinController.dispose();
    securityQuestionOneController.dispose();
    securityQuestionTwoController.dispose();
    securityQuestionThreeController.dispose();

    
   
    //sercuritlyQuestionAnswer.dispose();
    super.dispose();
  }





}