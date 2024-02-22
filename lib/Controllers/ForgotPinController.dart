import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPinController extends GetxController{

final otp = TextEditingController();
final enterNewPin = TextEditingController();
final confirmEnterNewPin = TextEditingController();

RxBool isChecked = false.obs;
@override
  void dispose() {
    otp.dispose();
    enterNewPin.dispose();
    confirmEnterNewPin.dispose();
    
   
    
    super.dispose();
  }
}