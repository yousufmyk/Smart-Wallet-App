import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// import 'package:mobile_banking/utils/widgets/slider.dart';
import 'package:slider_button/slider_button.dart';
import 'package:wallet_app/component/WAPaymentCompeteDialog.dart';
import 'package:wallet_app/component/WASendViaComponent.dart';
import 'package:wallet_app/model/WalletAppModel.dart';
import 'package:wallet_app/utils/WAColors.dart';
import 'package:wallet_app/utils/WADataGenerator.dart';
import 'package:wallet_app/utils/WAWidgets.dart';

import '../main.dart';
import '../model/cardDetailsModel.dart';

class WAPayToComponent extends StatefulWidget {
  static String tag = '/WAPayToComponent';
  // final CreditCardModel data;

  final WAOrganizationModel? organizationModel;

  WAPayToComponent({this.organizationModel, /*required this.data*/});

  @override
  WAPayToComponentState createState() => WAPayToComponentState();
}

class WAPayToComponentState extends State<WAPayToComponent> {
  TextEditingController amountController = TextEditingController(text: "500");
  TextEditingController subscribeNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  FocusNode subscribeNameFocusNode = FocusNode();

  FocusNode phoneFocusNode = FocusNode();

  List<String> amountList = [
    "\AED500",
    "\AED800",
    "\AED1000",
  ];

  List<WACardModel> sendViaCardList = waSendViaCardList();
  WACardModel selectedCard = WACardModel();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    selectedCard = sendViaCardList[0];
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecorationWithRoundedCorners(
        backgroundColor: context.cardColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            16.height,
            Text('Pay To', style: boldTextStyle()).center(),
            8.height,
            Divider(thickness: 2, color: Colors.grey.withOpacity(0.2)),
            16.height,
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  height: 100,
                  width: 250,
                  decoration: boxDecorationRoundedWithShadow(16,
                      backgroundColor:
                          appStore.isDarkModeOn ? cardDarkColor : white),
                  margin: EdgeInsets.only(top: 30),
                ),
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.circular(16),
                        backgroundColor:
                            widget.organizationModel!.color!.withOpacity(0.2),
                      ),
                      child: ImageIcon(
                        AssetImage(
                            '${widget.organizationModel!.image!.validate()}'),
                        size: 30,
                        color: widget.organizationModel!.color!,
                      ),
                    ),
                    8.height,
                    Text('${widget.organizationModel!.title!.validate()}',
                        style: boldTextStyle()),
                    4.height,
                    Text('${widget.organizationModel!.subTitle!.validate()}',
                        style: secondaryTextStyle()),
                  ],
                ),
              ],
            ).center(),
            16.height,
            Text('Send Via', style: boldTextStyle(size: 18)).paddingLeft(16),
            8.height,
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(left: 16, right: 16),
              width: context.width(),
              decoration: boxDecorationRoundedWithShadow(16,
                  backgroundColor:
                      appStore.isDarkModeOn ? cardDarkColor : white),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: selectedCard,
                  items: sendViaCardList.map((item) {
                    return DropdownMenuItem<WACardModel>(
                      value: item,
                      child: WASendViaComponent(item: item, /*data: widget.data*/),
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
            Text('Amount', style: boldTextStyle(size: 18)).paddingLeft(16),
            AppTextField(
              controller: amountController,
              autoFocus: false,
              textAlign: TextAlign.center,
              textFieldType: TextFieldType.OTHER,
              keyboardType: TextInputType.number,
              textStyle: TextStyle(fontSize: 22),
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
                    padding:
                        EdgeInsets.only(left: 22, right: 22, top: 8, bottom: 8),
                    child: Text('${amountList[index]}',
                        style: secondaryTextStyle(color: WAPrimaryColor)),
                  ).onTap(
                    () {
                      amountController.text = amountList[index];
                      setState(() {});
                    },
                  );
                },
              ),
            ).center(),
            16.height,
            Text("Biller's Name", style: boldTextStyle(size: 18))
                .paddingLeft(16),
            16.height,
            AppTextField(
              autoFocus: false,
              decoration: waInputDecoration(
                  hint: "Enter Biller name here",
                  bgColor: context.cardColor,
                  borderColor: Colors.grey),
              textFieldType: TextFieldType.NAME,
              keyboardType: TextInputType.name,
              controller: subscribeNameController,
              focus: subscribeNameFocusNode,
              nextFocus: phoneFocusNode,
            ).paddingOnly(left: 16, right: 16, bottom: 16),
            Text("Biller's No", style: boldTextStyle(size: 18)).paddingLeft(16),
            16.height,
            AppTextField(
              autoFocus: false,
              decoration: waInputDecoration(
                  hint: "Enter Biller No here",
                  bgColor: context.cardColor,
                  borderColor: Colors.grey),
              textFieldType: TextFieldType.PHONE,
              keyboardType: TextInputType.phone,
              controller: phoneController,
              focus: phoneFocusNode,
            ).paddingOnly(left: 16, right: 16, bottom: 16),
            SliderButton(
              buttonSize: 50,
              backgroundColor: WAPrimaryColor,
              dismissible: true,
              action: () {
                ///Do something here
                showInDialog(context, builder: (context) {
                  return WAPaymentCompletedDialog(
                    /*data: widget.data,*/
                  );
                });
              },
              label: Text("Swipe for Payment", style: boldTextStyle()),
              icon: Icon(Icons.arrow_forward, color: WAPrimaryColor),
            ).center(),

            150.height
          ],
        ),
      ),
    );
  }
}
