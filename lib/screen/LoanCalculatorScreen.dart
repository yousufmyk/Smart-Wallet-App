import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../../../utils/flutter_fluid_slider.dart';
import 'package:nb_utils/nb_utils.dart';

import '../dashboard/smart_home/utils/colors.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../../../utils/flutter_fluid_slider.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../model/cardDetailsModel.dart';
import 'WALoanApplicationSubmitScree.dart';

class LoanCalculatorScreen extends StatefulWidget {
  final CreditCardModel data;
  const LoanCalculatorScreen({
    Key? key,
    required this.data,
  })  : assert(data != null),
        super(key: key);
  //const LoanCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<LoanCalculatorScreen> createState() =>
      _LoanCalculatorScreenState(data: data);
}

class _LoanCalculatorScreenState extends State<LoanCalculatorScreen> {
  _LoanCalculatorScreenState({
    required this.data,
  }) : assert(data != null);
  final CreditCardModel data;
  var amount = TextEditingController(text: "AED: ");
  String dropdownValue = 'Once In A Month';
  String MakeModelDropDown = 'Toyota';

  var value = 10;

  var valueforScond = 1.0;
  //var value = 5000.0;
  @override
  void initState() {
    super.initState();
    init();
    // /getLimit();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var value = 5000.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Loan Calculator',
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
        width: context.width(),
        height: context.height(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/mobile_banking/wa_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('How much loan needed?',
                          style: boldTextStyle(size: 22, color: black)),
                    ),
                    10.height,
                    Container(
                      height: 150,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border:
                              Border.all(width: 1, color: Colors.blueAccent)),
                      child: Column(
                        children: [
                          Text("Amount Needed",
                              style: boldTextStyle(size: 15, color: black)),
                          AppTextField(
                            controller: amount,
                            autoFocus: false,
                            textAlign: TextAlign.center,
                            textFieldType: TextFieldType.OTHER,
                            keyboardType: TextInputType.number,
                            textStyle: TextStyle(fontSize: 22, color: black),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5))),
                            ),
                          ).paddingOnly(left: 16, right: 16),
                          10.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Text("Hajj/Umarah",
                                        style: boldTextStyle(
                                            size: 15, color: black)),
                                    Text("2023",
                                        style: boldTextStyle(
                                            size: 15, color: black))
                                  ],
                                ),
                              ),
                              Container(
                                child: Icon(Icons.filter_list_rounded),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              20.height,

              Container(
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border:
                              Border.all(width: 1, color: Colors.blueAccent)),
                      child: Column(
                        children: [
                          Text("Loan term",
                              style: boldTextStyle(size: 15, color: black)),
                          30.height,
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: FluidSlider(
                              start: Text('0',
                                  style: primaryTextStyle(color: white)),
                              end: Text('60',
                                  style: primaryTextStyle(color: white)),
                              value: valueforScond,
                              labelsTextStyle: primaryTextStyle(),
                              valueTextStyle:
                                  primaryTextStyle(color: textPrimaryColor),
                              onChanged: (double newValue) {
                                setState(() {
                                  valueforScond = newValue;
                                  // controller.AtmDomesticLimitValue = newValue;
                                });
                              },
                              min: 0.0,
                              max: 60,
                            ),
                          ),
                          20.height,
                          Text("Max 60 Months/ 5 Years")
                        ],
                      ),
                    ),
                    20.height,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Select How Will you pay?',
                          style: boldTextStyle(size: 22, color: black)),
                    ),
                    10.height,
                    Container(
                      child: DropdownButton<String>(
                        // Step 3.
                        icon: Icon(Icons.arrow_drop_down_circle_outlined),
                        isExpanded: true,
                        disabledHint: Text("Select"),
                        //dropdownColor: Color.fromARGB(255, 99, 185, 255),

                        value: dropdownValue,
                        // Step 4.
                        items: <String>[
                          'Once In A Month',
                          'twice In A Month',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ).paddingAll(16),
                  ],
                ),
              ),

              20.height,
              Container(
                width: context.width(),
                height: 190,
                color: Color.fromARGB(255, 225, 236, 255),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("You need to pay:"),
                    Text("AED: 150.00 /month",
                        style: boldTextStyle(size: 22, color: black)),
                    DialogButton(
                      // onPressed: () {
                      //   //  WADashboardScreen(
                      //   //     data: data,
                      //   //   ).launch(context);
                      // },
                      onPressed: () {
                        showInDialog(context, builder: (context) {
                          return LoanSubmittedDialog(
                            data: data,
                          );
                        });
                      },
                      color: const Color.fromRGBO(0, 179, 134, 1.0),
                      child: const Text(
                        'Apply For Loan',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )

              // SliderButton(
              //   buttonSize: 50,
              //   backgroundColor: WAPrimaryColor,
              //   dismissible: true,
              //   disable: false,
              //   action: () {
              //     ///Do something here
              //     // showInDialog(context, builder: (context) {
              //     //   return WAMoneyTransferCompleteDialog(
              //     //     data: data,
              //     //   );
              //     // });
              //   },
              //   label: Text("Slide To begin", style: boldTextStyle()),
              //   icon: Icon(Icons.arrow_forward, color: WAPrimaryColor),
              // ).center(),
              // SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
