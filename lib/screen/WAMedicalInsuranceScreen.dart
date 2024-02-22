import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gif_view/gif_view.dart';

import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../model/cardDetailsModel.dart';
import '../utils/WAColors.dart';
// import '../utils/widgets/slider.dart';
import 'package:slider_button/slider_button.dart';

import 'InsuranceWebRoutes/Oreint.dart';
import 'InsuranceWebRoutes/Sagar.dart';
import 'InsuranceWebRoutes/dni.dart';
import 'InsuranceWebRoutes/salamaa.dart';
import 'InsuranceWebRoutes/sukoon.dart';
import 'WATravelLoanCalculatorScreen.dart';

class MedicalInsuranceScreen extends StatefulWidget {
  final CreditCardModel data;

  //var futureList;
  const MedicalInsuranceScreen({
    Key? key,
    required this.data,
    //required this.futureList,
  })  : assert(data != null),
        super(key: key);

  @override
  State<MedicalInsuranceScreen> createState() => _MedicalInsuranceScreenState();
}

class _MedicalInsuranceScreenState extends State<MedicalInsuranceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Explore Insurance Plans',
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
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.cyan[50],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image(
                              image: AssetImage(
                                  "images/mobile_banking/orientIns.png")),
                          Text("Orient Insurance")
                        ],
                      ),
                      Column(
                        children: [
                          Text("Plan\nName",
                              style:
                                  boldTextStyle(color: Colors.black, size: 15)),
                          Text("I-Med")
                        ],
                      ),
                      Column(
                        children: [
                          Text("Medical \nCover (AED)",
                              style:
                                  boldTextStyle(color: Colors.black, size: 15)),
                          Text("150,000")
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await WAOrientInuranceUrlScreen().launch(context);
                        },
                        child: Text(
                          "Check\nPreminum",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              5.height,
              Container(
                decoration: BoxDecoration(
                    color: Colors.cyan[50],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image(
                              image: AssetImage(
                                  "images/mobile_banking/AlSagarIns.png")),
                          Text("Al Sagr Insurance")
                        ],
                      ),
                      Column(
                        children: [
                          Text("Plan\nName",
                              style:
                                  boldTextStyle(color: Colors.black, size: 15)),
                          Text("Silver-\nPlan A")
                        ],
                      ),
                      Column(
                        children: [
                          Text("Medical \nCover (AED)",
                              style:
                                  boldTextStyle(color: Colors.black, size: 15)),
                          Text("150,000")
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await WAAlSagarInuranceUrlScreen().launch(context);
                        },
                        child: Text(
                          "Check\nPreminum",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              5.height,
              Container(
                decoration: BoxDecoration(
                    color: Colors.cyan[50],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image(
                              image: AssetImage(
                                  "images/mobile_banking/DNIins.png")),
                          Text("Dubai National\nInsurance")
                        ],
                      ),
                      Column(
                        children: [
                          Text("Plan\nName",
                              style:
                                  boldTextStyle(color: Colors.black, size: 15)),
                          Text("Silver")
                        ],
                      ),
                      Column(
                        children: [
                          Text("Medical \nCover (AED)",
                              style:
                                  boldTextStyle(color: Colors.black, size: 15)),
                          Text("150,000")
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await WADniInuranceUrlScreen().launch(context);
                        },
                        child: Text(
                          "Check\nPreminum",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              5.height,
              Container(
                decoration: BoxDecoration(
                    color: Colors.cyan[50],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image(
                              image: AssetImage(
                                  "images/mobile_banking/SalamaIns.png")),
                          Text("Salama Insurance")
                        ],
                      ),
                      Column(
                        children: [
                          Text("Plan\nName",
                              style:
                                  boldTextStyle(color: Colors.black, size: 15)),
                          Text("Basic")
                        ],
                      ),
                      Column(
                        children: [
                          Text("Medical \nCover (AED)",
                              style:
                                  boldTextStyle(color: Colors.black, size: 15)),
                          Text("150,000")
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await WAAlSalamaaInuranceUrlScreen().launch(context);
                        },
                        child: Text(
                          "Check\nPreminum",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              5.height,
              Container(
                decoration: BoxDecoration(
                    color: Colors.cyan[50],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image(
                              image: AssetImage(
                                  "images/mobile_banking/SukonIns.png")),
                          Text("Sukoon Insurance")
                        ],
                      ),
                      Column(
                        children: [
                          Text("Plan\nName",
                              style:
                                  boldTextStyle(color: Colors.black, size: 15)),
                          Text("Safe")
                        ],
                      ),
                      Column(
                        children: [
                          Text("Medical \nCover (AED)",
                              style:
                                  boldTextStyle(color: Colors.black, size: 15)),
                          Text("150,000")
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await WASukoonInuranceUrlScreen().launch(context);
                        },
                        child: Text(
                          "Check\nPreminum",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
