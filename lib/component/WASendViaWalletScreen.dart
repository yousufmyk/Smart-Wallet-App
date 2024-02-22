import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../dashboard/smart_home/component/devices_component.dart';
import '../../dashboard/smart_home/component/rooms_component.dart';
import '../../dashboard/smart_home/component/usage_history_component.dart';
import '../../dashboard/smart_home/models/smart_home_info_model.dart';
import '../../dashboard/smart_home/utils/colors.dart';
import '../../dashboard/smart_home/utils/common.dart';
import '../../dashboard/smart_home/utils/images.dart';




import '../../dashboard/smart_home/utils/constant.dart';

import 'package:slider_button/slider_button.dart';

import '../Controllers/recipentsController.dart';
import '../main.dart';
import '../model/WalletAppModel.dart';
import '../model/cardDetailsModel.dart';
import '../utils/WAColors.dart';
import '../utils/WADataGenerator.dart';
import '../utils/WAWidgets.dart';
import 'WALimitSubmitButtonDailog.dart';
import 'WAMoneyTransferCompeteDialog.dart';
import 'WARecentPayeesComponent.dart';
import 'WASendViaComponent.dart';

class SendWalletFragment extends StatefulWidget {
  // final CreditCardModel data;
  
  // //var futureList;
  // const SendWalletFragment({
  //   Key? key,
  //   required this.data, 
  //   //required this.futureList,
  // })  : assert(data != null),
  //       super(key: key);

  @override
  _SendWalletFragmentState createState() => _SendWalletFragmentState(/*data:data*/);
}

class _SendWalletFragmentState extends State<SendWalletFragment> {
  // _SendWalletFragmentState({
  //   required this.data,
  //   //required this.futureList,
  // }) : assert(data != null);
  // final CreditCardModel data;
  final controller = Get.put(ReceiptsNameController());
  TextEditingController amountController =
      TextEditingController(text: "500");
  List<SmartHomeInfoModel> setUsageHistoryDetail = getUsageHistoryList();
  List<SmartHomeInfoModel> setRoomsDetail = getRoomsInfoList();
  List<SmartHomeInfoModel> setDevicesDetail = getDevicesInfoList();
  
  List<WACardModel> sendViaCardList = waSendViaCardList();
  WACardModel selectedCard = WACardModel();
  FocusNode receiptNameFocusNode = FocusNode();
  FocusNode accountFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }
   Future<void> init() async {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
    selectedCard = sendViaCardList[0];
    await Future.delayed(Duration(milliseconds: 500));
  }

 

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
     return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            
          ),
          body: Container(
          height: context.mediaQuerySize.height,
          width: context.mediaQuerySize.width,
          // padding: EdgeInsets.only(top: 60),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text('Send Via', style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                8.height,
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(left: 16, right: 16),
                  width: context.mediaQuerySize.width,
                  decoration: boxDecorationRoundedWithShadow(16,
                      backgroundColor: context.cardColor),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedCard,
                      items: sendViaCardList.map((item) {
                        return DropdownMenuItem<WACardModel>(
                          value: item,
                          child: WASendViaComponent(item: item ,/*data: data,*/),
                        );
                      }).toList(),
                      onChanged: (WACardModel? value) {
                        selectedCard = value!;
                        setState(() {});
                      },
                    ),
                  ),
                ),
                16.height,
                
                16.height,
                Text('Amount', style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                AppTextField(
                  controller: amountController,
                  autoFocus: false,
                  textAlign: TextAlign.center,
                  textFieldType: TextFieldType.OTHER,
                  keyboardType: TextInputType.number,
                  textStyle: TextStyle(fontSize: 22, color: black),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.5))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.5))),
                  ),
                ).paddingOnly(left: 16, right: 16),
                16.height,
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: 16,
                  children: List.generate(
                    amountList.length,
                    (index) {
                      return Container(
                        decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: WAPrimaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(18)),
                        padding: EdgeInsets.only(
                            left: 22, right: 22, top: 8, bottom: 8),
                        child: Text('AED${amountList[index]}',
                            style: secondaryTextStyle(
                                color: appStore.isDarkModeOn
                                    ? black
                                    : WAPrimaryColor)),
                      ).onTap(
                        () {
                          amountController.text = amountList[index]!;
                          setState(() {});
                        },
                      );
                    },
                  ),
                ).center(),
                16.height,
                Text("Receipt's Name",
                        style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                16.height,
                AppTextField(
                  autoFocus: false,
                  decoration: waInputDecoration(
                    hint: "Enter receipt's name here",
                    bgColor: context.cardColor,
                    borderColor: Colors.grey,
                  ),
                  textFieldType: TextFieldType.NAME,
                  keyboardType: TextInputType.name,
                  controller: controller.receiptsNameController,
                  focus: receiptNameFocusNode,
                  nextFocus: accountFocusNode,
                ).paddingOnly(left: 16, right: 16, bottom: 16),
                Text("Receiver's Account Number",
                        style: boldTextStyle(size: 18, color: black))
                    .paddingLeft(16),
                16.height,
                AppTextField(
                  autoFocus: false,
                  decoration: waInputDecoration(
                      hint: "Enter Receiver's name here",
                      bgColor: context.cardColor),
                  textFieldType: TextFieldType.NAME,
                  keyboardType: TextInputType.name,
                  controller: controller.reciverAccountNumController,
                  focus: accountFocusNode,
                ).paddingOnly(left: 16, right: 16),
                16.height,
               
                SliderButton(
                  buttonSize: 50,
                  backgroundColor: WAPrimaryColor,
                  dismissible: true,
                  action: () {
                    ///Do something here
                    showInDialog(context, builder: (context) {
                      return WAMoneyTransferCompleteDialog(/*data: data,*/);
                    });
                  },
                  label: Text("Swipe for Payment", style: boldTextStyle()),
                  icon: Icon(Icons.arrow_forward, color: WAPrimaryColor),
                ).center(),
                16.height,
              ],
            ),
          ),
        ),
        )
     );
   
  }
}
