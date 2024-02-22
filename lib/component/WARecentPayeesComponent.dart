import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/model/WalletAppModel.dart';
import 'package:wallet_app/utils/WADataGenerator.dart';
import 'package:wallet_app/utils/WAWidgets.dart';


import '../Controllers/recipentsController.dart';
import '../model/cardDetailsModel.dart';
import '../utils/WAColors.dart';
import 'WASendViaWalletScreen.dart';


class WARecentPayeesComponent extends StatefulWidget {
  // final CreditCardModel data;
  // const WARecentPayeesComponent({
  //   Key? key,
  //   required this.data,
  // })  : assert(data != null),
  //       super(key: key);

  // static String tag = '/WARecentPayeesComponent';

  @override
  WARecentPayeesComponentState createState() => WARecentPayeesComponentState(/*data: data*/);
}

class WARecentPayeesComponentState extends State<WARecentPayeesComponent> {
  //  WARecentPayeesComponentState({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;

  final controller = Get.put(ReceiptsNameController());
  List<WARecentPayeesModel> recentPayeesList = waRecentPayeesList();
  TextEditingController amountController =
      TextEditingController(text: "\u002450");
 bool isSwitched = false;  
  var textValue = 'Switch is OFF';  
  
  void toggleSwitch() {  
  
    if(isSwitched == false)  
    {  
      setState(() {  
        isSwitched = true;  
        textValue = 'Switch Button is ON';  
      });  
      print('Switch Button is ON');  
    }  
    else  
    {  
      setState(() {  
        isSwitched = false;  
        textValue = 'Switch Button is OFF';  
      });  
      print('Switch Button is OFF');  
    }  
  }  

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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: HorizontalList(
        spacing: 16,
        padding: EdgeInsets.only(left: 16, right: 16),
        itemCount: recentPayeesList.take(4).length,
        itemBuilder: (BuildContext context, int index) {
          WARecentPayeesModel mData = recentPayeesList[index];
          return index == 3
              ? Stack(
                  children: [
                    Container(
                      width: 90,
                      height: 105,
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.circular(12),
                        // backgroundColor: context.cardColor,
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          waCommonCachedNetworkImage(mData.image.validate(), height: 50, width: 50),
                          4.height,
                          Text(mData.name.toString(), style: boldTextStyle(size: 12), maxLines: 1),
                          Text(mData.number.toString(), style: secondaryTextStyle(size: 11), maxLines: 1),
                        ],
                      ),
                    ),
                    Container(
                      width: 90,
                      height: 105,
                      alignment: Alignment.center,
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.circular(8),
                        backgroundColor: Colors.black87.withOpacity(0.7),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: white, size: 18),
                          Text('3', style: secondaryTextStyle(color: white)),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(
                  width: 90,
                  decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                    Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: 16,
                  children: List.generate(
                    1,
                    (index) {
                      return Container(
                       child: waCommonCachedNetworkImage(mData.image.validate(), height: 50, width: 50).cornerRadiusWithClipRRect(30),
                      ).onTap(
                        () {
                          controller.receiptsNameController.text = mData.name!;
                          controller.reciverAccountNumController.text = mData.number!;
                           
                                
                          setState(() {});
                        },
                      );
                    },
                  ),
                ).center(),

                      4.height,
                      Text(mData.name.toString(), style: boldTextStyle(size: 12), maxLines: 1),
                      Text(mData.number.toString(), style: secondaryTextStyle(size: 11), maxLines: 1),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
