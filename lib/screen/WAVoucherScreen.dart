import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wallet_app/model/WalletAppModel.dart';
import 'package:wallet_app/utils/WADataGenerator.dart';

import '../component/VoucherRedeemScreen.dart';
import '../component/WAVoucherDailog.dart';
import '../main.dart';
import '../model/cardDetailsModel.dart';

class WAVoucherScreen extends StatefulWidget {
  // final CreditCardModel data;
  // const WAVoucherScreen({
  //   Key? key,
  //   required this.data,
  // })  : assert(data != null),
  //       super(key: key);
  static String tag = '/WAVoucherScreen';

  @override
  WAVoucherScreenState createState() => WAVoucherScreenState(/*data: data*/);
}

class WAVoucherScreenState extends State<WAVoucherScreen> {
  // WAVoucherScreenState({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;
  List<WAVoucherModel> voucherList = waVouchersList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Vouchers',
            style: boldTextStyle(color: Colors.black, size: 20),
          ),
          leading: Container(
            margin: EdgeInsets.all(8),
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: context.cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: Icon(Icons.arrow_back,
                color: appStore.isDarkModeOn ? white : black),
          ).onTap(() {
            finish(context);
          }),
          centerTitle: true,
          elevation: 0.0,
          //brightness: Brightness.dark,
        ),
        body: Container(
          height: context.height(),
          width: context.width(),
          padding: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: Container(
            margin: EdgeInsets.only(top: 30),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32), topLeft: Radius.circular(32)),
              backgroundColor: context.cardColor,
            ),
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 10,
                // runSpacing: 16,
                // alignment: WrapAlignment.center,
                // children: voucherList.map((item) {
                //   return WAVoucherComponent(voucherModel: item).onTap(
                //     () {
                //      showInDialog(context, builder: (context) {
                //       return WAVoucherDialog();
                //     });
                //     }
                //   );
                // }).toList(),
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purple[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                image: AssetImage(
                                    "images/mobile_banking/wa_macdonals.jpeg"),
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                  "Voucher Valued at AED50\nor 10% off at McDonalds.",
                                  style: boldTextStyle(size: 18, color: black))
                            ],
                          ),
                          15.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Expiers"),
                                  Text("04 Dec 2023",
                                      style: boldTextStyle(
                                          size: 15, color: Colors.black)),
                                  5.height,
                                  Text("Terms & Condition Apply",
                                      style: boldTextStyle(
                                          size: 10, color: Colors.blueAccent))
                                ],
                              ),
                              DialogButton(
                                // onPressed: () {
                                //   //  WADashboardScreen(
                                //   //     data: data,
                                //   //   ).launch(context);
                                // },
                                onPressed: () {
                                  showInDialog(context, builder: (context) {
                                    return VoucherReedemDialog(
                                      /*data: data,*/
                                    );
                                  });
                                },

                                color: const Color.fromRGBO(0, 179, 134, 1.0),
                                width: 50,
                                child: const Text(
                                  'Get',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  30.height,
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purple[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                image: AssetImage(
                                    "images/mobile_banking/Screenshot 2023-03-17 152637.png"),
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                  "Voucher Valued at AED50\nor 10% off at Louis Vuitton.",
                                  style: boldTextStyle(size: 18, color: black))
                            ],
                          ),
                          15.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Expiers"),
                                  Text("04 Dec 2023",
                                      style: boldTextStyle(
                                          size: 15, color: Colors.black)),
                                  5.height,
                                  Text("Terms & Condition Apply",
                                      style: boldTextStyle(
                                          size: 10, color: Colors.blueAccent))
                                ],
                              ),
                             DialogButton(
                                // onPressed: () {
                                //   //  WADashboardScreen(
                                //   //     data: data,
                                //   //   ).launch(context);
                                // },
                                onPressed: () {
                                  showInDialog(context, builder: (context) {
                                    return VoucherReedemDialog(
                                      /*data: data,*/
                                    );
                                  });
                                },

                                color: const Color.fromRGBO(0, 179, 134, 1.0),
                                width: 50,
                                child: const Text(
                                  'Get',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  20.height,
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purple[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                image: AssetImage(
                                    "images/mobile_banking/Screenshot 2023-03-17 152850.png"),
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                  "Voucher Valued at AED50\nor 10% off at Nike.",
                                  style: boldTextStyle(size: 18, color: black))
                            ],
                          ),
                          15.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Expiers"),
                                  Text("04 Dec 2023",
                                      style: boldTextStyle(
                                          size: 15, color: Colors.black)),
                                  5.height,
                                  Text("Terms & Condition Apply",
                                      style: boldTextStyle(
                                          size: 10, color: Colors.blueAccent))
                                ],
                              ),
                             DialogButton(
                                // onPressed: () {
                                //   //  WADashboardScreen(
                                //   //     data: data,
                                //   //   ).launch(context);
                                // },
                                onPressed: () {
                                  showInDialog(context, builder: (context) {
                                    return VoucherReedemDialog(
                                      /*data: data,*/
                                    );
                                  });
                                },

                                color: const Color.fromRGBO(0, 179, 134, 1.0),
                                width: 50,
                                child: const Text(
                                  'Get',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  20.height,
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purple[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                image: AssetImage(
                                    "images/mobile_banking/Screenshot 2023-03-17 153018.png"),
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                  "Voucher Valued at AED50\nor 10% off at Zara.",
                                  style: boldTextStyle(size: 18, color: black))
                            ],
                          ),
                          15.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Expiers"),
                                  Text("04 Dec 2023",
                                      style: boldTextStyle(
                                          size: 15, color: Colors.black)),
                                  5.height,
                                  Text("Terms & Condition Apply",
                                      style: boldTextStyle(
                                          size: 10, color: Colors.blueAccent))
                                ],
                              ),
                              DialogButton(
                                // onPressed: () {
                                //   //  WADashboardScreen(
                                //   //     data: data,
                                //   //   ).launch(context);
                                // },
                                onPressed: () {
                                  showInDialog(context, builder: (context) {
                                    return VoucherReedemDialog(
                                      /*data: data,*/
                                    );
                                  });
                                },

                                color: const Color.fromRGBO(0, 179, 134, 1.0),
                                width: 50,
                                child: const Text(
                                  'Get',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  20.height,
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purple[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                image: AssetImage(
                                    "images/mobile_banking/Screenshot 2023-03-17 153139.png"),
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                  "Voucher Valued at AED50\nor 10% off at H&M.",
                                  style: boldTextStyle(size: 18, color: black))
                            ],
                          ),
                          15.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Expiers"),
                                  Text("04 Dec 2023",
                                      style: boldTextStyle(
                                          size: 15, color: Colors.black)),
                                  5.height,
                                  Text("Terms & Condition Apply",
                                      style: boldTextStyle(
                                          size: 10, color: Colors.blueAccent))
                                ],
                              ),
                              DialogButton(
                                // onPressed: () {
                                //   //  WADashboardScreen(
                                //   //     data: data,
                                //   //   ).launch(context);
                                // },
                                onPressed: () {
                                  showInDialog(context, builder: (context) {
                                    return VoucherReedemDialog(
                                      /*data: data,*/
                                    );
                                  });
                                },

                                color: const Color.fromRGBO(0, 179, 134, 1.0),
                                width: 50,
                                child: const Text(
                                  'Get',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  20.height,
                ],
              ).paddingAll(16),
            ),
          ),
        ),
      ),
    );
  }
}
