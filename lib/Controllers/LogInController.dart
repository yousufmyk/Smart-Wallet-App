import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

final email = TextEditingController();
final password = TextEditingController();
RxBool isChecked = false.obs;


@override
  void dispose() {
    email.dispose();
    password.dispose();
    //confirmEnterNewPin.dispose();
    
   
    
    super.dispose();
  }



}