import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social_share/social_share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import '../utils/WAWidgets.dart';

class CurrencyConvertScreen extends StatefulWidget {
  const CurrencyConvertScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyConvertScreen> createState() => _CurrencyConvertScreenState();
}

class _CurrencyConvertScreenState extends State<CurrencyConvertScreen> {
  final Uri _urlForOutLook = Uri.parse('https://outlook.office365.com/mail/');
  Future<void> _launchUrlOutLook() async {
    if (!await launchUrl(_urlForOutLook)) {
      throw Exception('Could not launch $_urlForOutLook');
    }
  }

  final Uri _urlForGmail = Uri.parse('https://mail.google.com/mail/');
  Future<void> _launchUrlGmail() async {
    if (!await launchUrl(_urlForGmail)) {
      throw Exception('Could not launch $_urlForOutLook');
    }
  }

  String baseValuedropdownValue = "USD";
  String convertValuedropdownValue = "AED";
  String cnvRate = "";
  TextEditingController amountController = TextEditingController();
  FocusNode amountFocusNode = FocusNode();

  convert() async {
    //var token = await SessionManager().get("token");
    final response = await http.get(
      Uri.parse(
          "https://v6.exchangerate-api.com/v6/720e30a9af770594dbaa0fd9/pair/${baseValuedropdownValue.toString()}/${convertValuedropdownValue.toString()}/"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());
      var conversionRate = (data as Map)['conversion_rate'];
      print("Ok");
      print(data);
      print(conversionRate);
      setState(() {
        cnvRate = conversionRate.toString();
      });
      //return CheckBalanceModel.fromJson(data);
    } else {
      //return CheckBalanceModel.fromJson(data);
      print("error");
      print(response.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Currency Converter',
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
      body: SingleChildScrollView(
        child: Container(
          height: context.mediaQuerySize.height,
          width: context.mediaQuerySize.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                //color: Color.fromARGB(255, 255, 254, 246),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    60.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: DropdownButton<String>(
                            // Step 3.
                            icon: Icon(Icons.arrow_drop_down_circle_outlined),
                            isExpanded: false,
                            disabledHint: Text("Select"),
                            //dropdownColor: Color.fromARGB(255, 99, 185, 255),

                            value: baseValuedropdownValue,
                            // Step 4.
                            items: <String>[
                              "USD",
                              "AFN",
                              "AED",
                              "ALL",
                              "AMD",
                              "ANG",
                              "AOA",
                              "ARS",
                              "AUD",
                              "AWG",
                              "AZN",
                              "BAM",
                              "BBD",
                              "BDT",
                              "BGN",
                              "BHD",
                              "BIF",
                              "BMD",
                              "BND",
                              "BOB",
                              "BRL",
                              "BSD",
                              "BTN",
                              "BWP",
                              "BYN",
                              "BZD",
                              "CAD",
                              "CDF",
                              "CHF",
                              "CLP",
                              "CNY",
                              "COP",
                              "CRC",
                              "CUP",
                              "CVE",
                              "CZK",
                              "DJF",
                              "DKK",
                              "DOP",
                              "DZD",
                              "EGP",
                              "ERN",
                              "ETB",
                              "EUR",
                              "FJD",
                              "FKP",
                              "FOK",
                              "GBP",
                              "GEL",
                              "GGP",
                              "GHS",
                              "GIP",
                              "GMD",
                              "GNF",
                              "GTQ",
                              "GYD",
                              "HKD",
                              "HNL",
                              "HRK",
                              "HTG",
                              "HUF",
                              "IDR",
                              "ILS",
                              "IMP",
                              "INR",
                              "IQD",
                              "IRR",
                              "ISK",
                              "JEP",
                              "JMD",
                              "JOD",
                              "JPY",
                              "KES",
                              "KGS",
                              "KHR",
                              "KID",
                              "KMF",
                              "KRW",
                              "KWD",
                              "KYD",
                              "KZT",
                              "LAK",
                              "LBP",
                              "LKR",
                              "LRD",
                              "LSL",
                              "LYD",
                              "MAD",
                              "MDL",
                              "MGA",
                              "MKD",
                              "MMK",
                              "MNT",
                              "MOP",
                              "MRU",
                              "MUR",
                              "MVR",
                              "MWK",
                              "MXN",
                              "MYR",
                              "MZN",
                              "NAD",
                              "NGN",
                              "NIO",
                              "NOK",
                              "NPR",
                              "NZD",
                              "OMR",
                              "PAB",
                              "PEN",
                              "PGK",
                              "PHP",
                              "PKR",
                              "PLN",
                              "PYG",
                              "QAR",
                              "RON",
                              "RSD",
                              "RUB",
                              "RWF",
                              "SAR",
                              "SBD",
                              "SCR",
                              "SDG",
                              "SEK",
                              "SGD",
                              "SHP",
                              "SLE",
                              "SLL",
                              "SOS",
                              "SRD",
                              "SSP",
                              "STN",
                              "SYP",
                              "SZL",
                              "THB",
                              "TJS",
                              "TMT",
                              "TND",
                              "TOP",
                              "TRY",
                              "TTD",
                              "TVD",
                              "TWD",
                              "TZS",
                              "UAH",
                              "UGX",
                              "UYU",
                              "UZS",
                              "VES",
                              "VND",
                              "VUV",
                              "WST",
                              "XAF",
                              "XCD",
                              "XDR",
                              "XOF",
                              "XPF",
                              "YER",
                              "ZAR",
                              "ZMW",
                              "ZWL",
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
                                baseValuedropdownValue = newValue!;
                              });
                            },
                          ),
                        ),
                        Container(
                          child: Text("Some Icon"),
                        ),
                        Container(
                          child: DropdownButton<String>(
                            // Step 3.
                            icon: Icon(Icons.arrow_drop_down_circle_outlined),
                            isExpanded: false,
                            disabledHint: Text("Select"),
                            //dropdownColor: Color.fromARGB(255, 99, 185, 255),

                            value: convertValuedropdownValue,
                            // Step 4.
                            items: <String>[
                              "USD",
                              "AED",
                              "AFN",
                              "ALL",
                              "AMD",
                              "ANG",
                              "AOA",
                              "ARS",
                              "AUD",
                              "AWG",
                              "AZN",
                              "BAM",
                              "BBD",
                              "BDT",
                              "BGN",
                              "BHD",
                              "BIF",
                              "BMD",
                              "BND",
                              "BOB",
                              "BRL",
                              "BSD",
                              "BTN",
                              "BWP",
                              "BYN",
                              "BZD",
                              "CAD",
                              "CDF",
                              "CHF",
                              "CLP",
                              "CNY",
                              "COP",
                              "CRC",
                              "CUP",
                              "CVE",
                              "CZK",
                              "DJF",
                              "DKK",
                              "DOP",
                              "DZD",
                              "EGP",
                              "ERN",
                              "ETB",
                              "EUR",
                              "FJD",
                              "FKP",
                              "FOK",
                              "GBP",
                              "GEL",
                              "GGP",
                              "GHS",
                              "GIP",
                              "GMD",
                              "GNF",
                              "GTQ",
                              "GYD",
                              "HKD",
                              "HNL",
                              "HRK",
                              "HTG",
                              "HUF",
                              "IDR",
                              "ILS",
                              "IMP",
                              "INR",
                              "IQD",
                              "IRR",
                              "ISK",
                              "JEP",
                              "JMD",
                              "JOD",
                              "JPY",
                              "KES",
                              "KGS",
                              "KHR",
                              "KID",
                              "KMF",
                              "KRW",
                              "KWD",
                              "KYD",
                              "KZT",
                              "LAK",
                              "LBP",
                              "LKR",
                              "LRD",
                              "LSL",
                              "LYD",
                              "MAD",
                              "MDL",
                              "MGA",
                              "MKD",
                              "MMK",
                              "MNT",
                              "MOP",
                              "MRU",
                              "MUR",
                              "MVR",
                              "MWK",
                              "MXN",
                              "MYR",
                              "MZN",
                              "NAD",
                              "NGN",
                              "NIO",
                              "NOK",
                              "NPR",
                              "NZD",
                              "OMR",
                              "PAB",
                              "PEN",
                              "PGK",
                              "PHP",
                              "PKR",
                              "PLN",
                              "PYG",
                              "QAR",
                              "RON",
                              "RSD",
                              "RUB",
                              "RWF",
                              "SAR",
                              "SBD",
                              "SCR",
                              "SDG",
                              "SEK",
                              "SGD",
                              "SHP",
                              "SLE",
                              "SLL",
                              "SOS",
                              "SRD",
                              "SSP",
                              "STN",
                              "SYP",
                              "SZL",
                              "THB",
                              "TJS",
                              "TMT",
                              "TND",
                              "TOP",
                              "TRY",
                              "TTD",
                              "TVD",
                              "TWD",
                              "TZS",
                              "UAH",
                              "UGX",
                              "UYU",
                              "UZS",
                              "VES",
                              "VND",
                              "VUV",
                              "WST",
                              "XAF",
                              "XCD",
                              "XDR",
                              "XOF",
                              "XPF",
                              "YER",
                              "ZAR",
                              "ZMW",
                              "ZWL",
                            ].map<DropdownMenuItem<String>>(
                                (String convertvalue) {
                              return DropdownMenuItem<String>(
                                value: convertvalue,
                                child: Text(
                                  convertvalue,
                                  style: TextStyle(fontSize: 20),
                                ),
                              );
                            }).toList(),
                            // Step 5.
                            onChanged: (String? covertnewValue) {
                              setState(() {
                                convertValuedropdownValue = covertnewValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    10.height,
                    Text("Exchange rate: $cnvRate"),
                    10.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("$baseValuedropdownValue" +
                            " ${amountController.text}"),
                        Text("="),
                        Text("$convertValuedropdownValue")
                      ],
                    ),
                    20.height,
                    AppTextField(
                      decoration: waInputDecoration(
                        hint: 'Enter your amount here',
                      ),
                      textAlign: TextAlign.center,
                      textFieldType: TextFieldType.NUMBER,
                      keyboardType: TextInputType.number,
                      controller: amountController,
                      focus: amountFocusNode,
                    ),
                    20.height,
                    ElevatedButton(
                        onPressed: () async {
                          await convert();
                        },
                        child: Text("Press"))
                  ],
                ),
              )
            ],
          ).paddingAll(30),
        ),
      ),
    );
  }
}
