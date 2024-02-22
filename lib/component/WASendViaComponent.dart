import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/model/WalletAppModel.dart';
import 'package:wallet_app/utils/WADataGenerator.dart';
import 'package:wallet_app/utils/WAWidgets.dart';


import '../main.dart';
import '../model/cardDetailsModel.dart';

class WASendViaComponent extends StatefulWidget {
  // final CreditCardModel data;
  final WACardModel? item;
  const WASendViaComponent({
    Key? key,
   /* required this.data,*/ this.item,
  });
        
  
  

 
  @override
  WASendViaComponentState createState() => WASendViaComponentState(/*data: data*/);
}

class WASendViaComponentState extends State<WASendViaComponent> {
  // WASendViaComponentState({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;
  List<WACardModel> sendViaCardList = waSendViaCardList();

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
      children: [
        Row(
          children: [
            Container(
              decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(4), backgroundColor: widget.item!.color!),
              padding: EdgeInsets.all(4),
              width: 60,
              height: 40,
              
              child: waCommonCachedNetworkImage('${widget.item!.image}', fit: BoxFit.fill, color: Colors.white),
            ),
            16.width,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mohamed Yousuf', style: boldTextStyle(size: 16, color: appStore.isDarkModeOn ? white : black), maxLines: 1),
                // Text(widget.data.cardOrderInfo!.primaryCardOrderInfo!.nameOnCard!, style: boldTextStyle(size: 16, color: appStore.isDarkModeOn ? white : black), maxLines: 1),
                // Text(data.cardOrderInfo!.secondaryCardOrderInfo!.elementAt(0).nameOnCard!, style: boldTextStyle(size: 16, color: appStore.isDarkModeOn ? white : black), maxLines: 1),
                
                Text("4000016544560595", style: secondaryTextStyle(size: 14, color: gray)),
                //Text(data.cardOrderInfo!.primaryCardOrderInfo!.card!, style: secondaryTextStyle(size: 14, color: gray)),
                //Text(data.cardOrderInfo!.primaryCardOrderInfo!.nameOnCard!, style: boldTextStyle(size: 16, color: appStore.isDarkModeOn ? white : black), maxLines: 1),
              ],
              
            ),
            
          ],
        ),

        


      ],
    );
  }
}
