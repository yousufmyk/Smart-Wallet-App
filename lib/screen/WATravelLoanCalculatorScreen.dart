import 'package:country_picker/country_picker.dart';
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
import '../utils/WAColors.dart';
import '../utils/WAWidgets.dart';
import 'WALoanApplicationSubmitScree.dart';
import 'package:intl/intl.dart';

import 'WASelectTravelLoanPlanScreen.dart';

class TravelLoanCalculatorScreen extends StatefulWidget {
  final CreditCardModel data;

  //var futureList;
  const TravelLoanCalculatorScreen({
    Key? key,
    required this.data,
    //required this.futureList,
  })  : assert(data != null),
        super(key: key);

  @override
  State<TravelLoanCalculatorScreen> createState() =>
      _TravelLoanCalculatorScreenState(data: data);
}

class _TravelLoanCalculatorScreenState
    extends State<TravelLoanCalculatorScreen> {
  _TravelLoanCalculatorScreenState({
    required this.data,
    //required this.futureList,
  }) : assert(data != null);
  final CreditCardModel data;
  var amount = TextEditingController(text: "AED: ");
  String dropdownChildValue = "0";
  String dropdownAdultValue = "0";
  String dropdownSeniorValue = "0";
  String ModelDropDiwnValue = 'Toyota';
  String ModelYear = '2023';
  TextEditingController departureCountryController = TextEditingController();
  TextEditingController arrivalCountryController = TextEditingController();
  TextEditingController dateinputController = TextEditingController();
  TextEditingController EnddateinputController = TextEditingController();

  FocusNode departureFocusNode = FocusNode();
  FocusNode arrivalFocusNode = FocusNode();

  var value = 10;
  String Countryvalue = "Select";

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
      body: Container(
        width: context.width(),
        height: context.height(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/mobile_banking/wa_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromARGB(97, 175, 175, 175),
                elevation: 0,
                bottom: TabBar(
                    labelColor: Colors.blueAccent,
                    unselectedLabelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('images/mobile_banking/wa_bg.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.white),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Single",
                          ),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Annual"),
                        ),
                      ),
                    ]),
              ),
              body: TabBarView(children: [
                SingleChildScrollView(
                  child: Column(
                    ///mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          // AtmDomesticLimitComponent(),
                          // PosDomesticLimitComponent(),
                          // E_ComDomesticLimitComponent(),
                          // NetWorkDomesticLimitComponent(),
                        ],
                      ),
                      32.height,

                      10.height,

                      Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text('Get a quote', style: boldTextStyle(size: 14))
                                .paddingLeft(16),
                      ),
                      8.height,
                      Padding(
                          padding: EdgeInsets.all(15),
                          child: AppTextField(
                            onTap: () {
                              print("hello");
                              // setState(() {
                              //    value = "country";
                              // });

                              showCountryPicker(
                                context: context,
                                //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                                exclude: <String>['KN', 'MF'],
                                favorite: <String>['SE'],
                                //Optional. Shows phone code before the country name.
                                showPhoneCode: false,

                                onSelect: (Country country) {
                                  print(
                                      'Select country: ${country.displayName}');

                                  setState(() {
                                    Countryvalue =
                                        country.displayNameNoCountryCode;
                                  });
                                  // SelectedCountry = country.displayName.toString();
                                },
                                // Optional. Sets the theme for the country list picker.
                                countryListTheme: CountryListThemeData(
                                  // Optional. Sets the border radius for the bottomsheet.
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40.0),
                                    topRight: Radius.circular(40.0),
                                  ),
                                  // Optional. Styles the search field.
                                  inputDecoration: InputDecoration(
                                    labelText: 'Search',
                                    hintText: 'Start typing to search',
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color(0xFF8C98A8)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                  ),

                                  // Optional. Styles the text in the search field
                                  searchTextStyle: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            },

                            autoFocus: false,
                            //initialValue: "Select",
                            // onChanged:

                            controller:
                                TextEditingController(text: Countryvalue),
                            decoration: waInputDecoration(
                              //hint: "Enter Beneficiary 's name here",
                              bgColor: context.cardColor,
                              borderColor: Colors.grey,
                            ),
                            textFieldType: TextFieldType.NAME,
                            keyboardType: TextInputType.name,
                            // controller: controller.receiptsNameController,
                            // focus: receiptNameFocusNode,
                            //nextFocus: ZipCodeFocusNode,
                          )),
                      16.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Number Of Adults',
                                style: boldTextStyle(size: 14))
                            .paddingLeft(16),
                      ),
                      8.height,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          //padding: EdgeInsets.all(150),
                          padding: EdgeInsets.only(right: 300),
                          child: Container(
                              child: DropdownButtonFormField(
                            isExpanded: false,
                            decoration: waInputDecoration(hint: "0"),
                            items: List.generate(99, (index) {
                              return DropdownMenuItem(
                                  child: Text('${index + 1}',
                                      style: secondaryTextStyle()),
                                  value: index + 1);
                            }),
                            onChanged: (value) {},
                          )).paddingLeft(16),
                        ),
                      ),
                      20.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Number Of Children',
                                style: boldTextStyle(size: 14))
                            .paddingLeft(16),
                      ),
                      8.height,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          //padding: EdgeInsets.all(150),
                          padding: EdgeInsets.only(right: 300),
                          child: Container(
                              child: DropdownButtonFormField(
                            isExpanded: false,
                            decoration: waInputDecoration(hint: "0"),
                            items: List.generate(99, (index) {
                              return DropdownMenuItem(
                                  child: Text('${index + 1}',
                                      style: secondaryTextStyle()),
                                  value: index + 1);
                            }),
                            onChanged: (value) {},
                          )).paddingLeft(16),
                        ),
                      ),
                      20.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Number Of Seniors',
                                style: boldTextStyle(size: 14))
                            .paddingLeft(16),
                      ),
                      8.height,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          //padding: EdgeInsets.all(150),
                          padding: EdgeInsets.only(right: 300),
                          child: Container(
                              child: DropdownButtonFormField(
                            isExpanded: false,
                            decoration: waInputDecoration(hint: "0"),
                            items: List.generate(99, (index) {
                              return DropdownMenuItem(
                                  child: Text('${index + 1}',
                                      style: secondaryTextStyle()),
                                  value: index + 1);
                            }),
                            onChanged: (value) {},
                          )).paddingLeft(16),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Start date",
                                style: boldTextStyle(size: 18, color: black))
                            .paddingLeft(16),
                      ),
                      Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.all(15),
                          height: 90,
                          child: Center(
                              child: AppTextField(
                            controller:
                                dateinputController, //editing controller of this TextField
                            decoration: waInputDecoration(
                                // bgColor: Colors.transparent,
                                hint: 'DD-MM-YYYY',
                                prefixIcon: Icons.date_range_outlined),
                            readOnly:
                                true, //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(
                                      2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000

                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  dateinputController.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                            textFieldType: TextFieldType.OTHER,
                          ))),

                      AppButton(
                        color: WAPrimaryColor,
                        width: context.width(),
                        child: Text('Next',
                            style: boldTextStyle(color: Colors.white)),
                        onTap: () {
                          // showInDialog(context, builder: (context) {
                          //   //return WAEditProfileDialog(data: data,);
                          //   return
                          // });
                          SelectTravelPlanScreen(
                            data: data,
                          ).launch(context);
                        },
                      ).cornerRadiusWithClipRRect(30).paddingOnly(
                          left: context.width() * 0.1,
                          right: context.width() * 0.1),
                      //       Text("In which you're arriving?",
                      //               style: boldTextStyle(size: 18, color: black))
                      //           .paddingLeft(16),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Wrap(
                        children: [
                          // AtmInternationalLimitComponent(),
                          // PosInternationalLimitComponent(),
                          // E_ComInternationalLimitComponent(),
                          // NetWorkInternationalLimitComponent()
                        ],
                      ),
                      32.height,
                      10.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text('Get a quote', style: boldTextStyle(size: 14))
                                .paddingLeft(16),
                      ),
                      8.height,
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: AppTextField(
                          decoration: waInputDecoration(
                            hint: 'Enter your traveling country here',
                          ),
                          textFieldType: TextFieldType.NAME,
                          keyboardType: TextInputType.name,
                          controller: departureCountryController,
                          focus: departureFocusNode,
                        ),
                      ),
                      16.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Number Of Adults',
                                style: boldTextStyle(size: 14))
                            .paddingLeft(16),
                      ),
                      8.height,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          //padding: EdgeInsets.all(150),
                          padding: EdgeInsets.only(right: 300),
                          child: Container(
                              child: DropdownButtonFormField(
                            isExpanded: false,
                            decoration: waInputDecoration(hint: "0"),
                            items: List.generate(99, (index) {
                              return DropdownMenuItem(
                                  child: Text('${index + 1}',
                                      style: secondaryTextStyle()),
                                  value: index + 1);
                            }),
                            onChanged: (value) {},
                          )).paddingLeft(16),
                        ),
                      ),
                      20.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Number Of Children',
                                style: boldTextStyle(size: 14))
                            .paddingLeft(16),
                      ),
                      8.height,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          //padding: EdgeInsets.all(150),
                          padding: EdgeInsets.only(right: 300),
                          child: Container(
                              child: DropdownButtonFormField(
                            isExpanded: false,
                            decoration: waInputDecoration(hint: "0"),
                            items: List.generate(99, (index) {
                              return DropdownMenuItem(
                                  child: Text('${index + 1}',
                                      style: secondaryTextStyle()),
                                  value: index + 1);
                            }),
                            onChanged: (value) {},
                          )).paddingLeft(16),
                        ),
                      ),
                      20.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Number Of Seniors',
                                style: boldTextStyle(size: 14))
                            .paddingLeft(16),
                      ),
                      8.height,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          //padding: EdgeInsets.all(150),
                          padding: EdgeInsets.only(right: 300),
                          child: Container(
                              child: DropdownButtonFormField(
                            isExpanded: false,
                            decoration: waInputDecoration(hint: "0"),
                            items: List.generate(99, (index) {
                              return DropdownMenuItem(
                                  child: Text('${index + 1}',
                                      style: secondaryTextStyle()),
                                  value: index + 1);
                            }),
                            onChanged: (value) {},
                          )).paddingLeft(16),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Start date",
                                style: boldTextStyle(size: 18, color: black))
                            .paddingLeft(16),
                      ),
                      Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.all(15),
                          height: 90,
                          child: Center(
                              child: AppTextField(
                            controller:
                                dateinputController, //editing controller of this TextField
                            decoration: waInputDecoration(
                                // bgColor: Colors.transparent,
                                hint: 'DD-MM-YYYY',
                                prefixIcon: Icons.date_range_outlined),
                            readOnly:
                                true, //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(
                                      2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000

                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  dateinputController.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                            textFieldType: TextFieldType.OTHER,
                          ))),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("End date",
                                style: boldTextStyle(size: 18, color: black))
                            .paddingLeft(16),
                      ),
                      Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.all(15),
                          height: 90,
                          child: Center(
                              child: AppTextField(
                            controller:
                                EnddateinputController, //editing controller of this TextField
                            decoration: waInputDecoration(
                                // bgColor: Colors.transparent,
                                hint: 'DD-MM-YYYY',
                                prefixIcon: Icons.date_range_outlined),
                            readOnly:
                                true, //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(
                                      2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000

                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  EnddateinputController.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                            textFieldType: TextFieldType.OTHER,
                          ))),
                      AppButton(
                        color: WAPrimaryColor,
                        width: context.width(),
                        child: Text('Next',
                            style: boldTextStyle(color: Colors.white)),
                        onTap: () {
                          showInDialog(context, builder: (context) {
                            //return WAEditProfileDialog(data: data,);
                          });
                        },
                      ).cornerRadiusWithClipRRect(30).paddingOnly(
                          left: context.width() * 0.1,
                          right: context.width() * 0.1),
                      32.height,
                    ],
                  ),
                ),
              ]),
            )),
      ),
    );
  }
}
