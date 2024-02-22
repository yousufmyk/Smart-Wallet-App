import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../component/WACardComponent.dart';
import '../../model/Api Service/Balance Api/checkBalanceApi.dart';

class CreditCardWidget extends StatelessWidget {
  late Text cardNumber;
  
  late Text expiryDate;

   CreditCardWidget({
    Key? key,
    required this.widget,
    required this.cardNumber,
    required this.expiryDate
    
  }) : super(key: key);

  final WACardComponent widget;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 8),
      decoration: boxDecorationRoundedWithShadow(
        30,
        backgroundColor: widget.cardModel!.color!,
        blurRadius: 10.0,
        spreadRadius: 4.0,
        shadowColor: widget.cardModel!.color!.withAlpha(50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: ImageIcon(
              AssetImage('images/mobile_banking/wa_visa.png'),
              size: 50,
              color: Colors.white,
            ),
          ),
          
           Text('Balance', style: secondaryTextStyle(color: Colors.white60)),
          8.height,
          
          30.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cardNumber = cardNumber,
              
              expiryDate = expiryDate
              
            ],
          ),
        ],
      ),
    );
  }
}
