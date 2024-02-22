import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LimitsController extends GetxController {

  // these controller are for Domestic limits
  double AtmDomesticLimitValue = 10..obs;
  double PosDomesticLimitValue = 10..obs;
  double E_ComDomesticLimitValue = 10..obs;
  double NetWorkDomesticLimitValue = 10..obs;
  // these controller are for International limits
  double AtmInternationalLimitValue = 10..obs;
  double PosInternationalLimitValue = 10..obs;
  double E_ComInternationalLimitValue = 10..obs;
  double NetWorkInternationalLimitValue = 10..obs;
  

RxBool isChecked = false.obs;





@override
  void dispose() {
    //limitValue.dispose();
    
    
   
    //sercuritlyQuestionAnswer.dispose();
    super.dispose();
  }





}