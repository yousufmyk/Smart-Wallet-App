import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gif_view/gif_view.dart';
import 'package:wallet_app/utils/WAColors.dart';

import '../model/cardDetailsModel.dart';
import '../screen/WADashboardScreen.dart';
import 'WAVoucherDailog.dart';

class VoucherReedemDialog extends StatefulWidget {
  // final CreditCardModel data;
  // const VoucherReedemDialog({
  //   Key? key,
  //   required this.data,
  // })  : assert(data != null),
  //       super(key: key);
  static String tag = '/WAMoneyTransferCompleteDialog';

  @override
  VoucherReedemDialogState createState() =>
      VoucherReedemDialogState(/*data: data*/);
}

class VoucherReedemDialogState extends State<VoucherReedemDialog> {
  TextEditingController amountController = TextEditingController(text: 'AED: ');
  // VoucherReedemDialogState({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;
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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // waCommonCachedNetworkImage(
        //     'https://media.istockphoto.com/id/1413221949/photo/smartphone-mobile-phone-with-credit-card-coins-and-shield-on-pink-background-online-shopping.jpg?s=612x612&w=0&k=20&c=xzctbABfzQV9REXwKKAHHXTON7mWY4Q_0_BkuFqDwAk=',
        //     height: 200,
        //     width: 200,
        //     fit: BoxFit.fill),

        // 16.height,
        // Text('Sucess!', style: secondaryTextStyle()),
        16.height,
        Text('Enter Amount',
            style: boldTextStyle(size: 22), textAlign: TextAlign.center),

        8.height,
        AppTextField(
          controller: amountController,
          autoFocus: false,
          textAlign: TextAlign.center,
          textFieldType: TextFieldType.OTHER,
          keyboardType: TextInputType.number,
          textStyle: TextStyle(fontSize: 22, color: black),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
          ),
        ).paddingOnly(left: 16, right: 16),
        8.height,
        AppButton(
          color: WAPrimaryColor,
          width: 180,
          height: 50,
          shapeBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          text: "Proceed",
          onTap: () {
            // WADashboardScreen(
            //   data: data,
            
            // ).launch(context);
            showInDialog(context, builder: (context) {
              return WAVoucherDialog();
            });
          },
          textStyle: boldTextStyle(color: Colors.white),
        ),
        16.height,
      ],
    );
  }
}
