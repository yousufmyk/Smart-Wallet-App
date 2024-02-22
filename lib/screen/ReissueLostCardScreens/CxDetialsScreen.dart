import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../component/WASelectAccountCoponent.dart';
import '../../main.dart';

class CxDetailsPage extends StatefulWidget {
  const CxDetailsPage({Key? key}) : super(key: key);

  @override
  State<CxDetailsPage> createState() => _CxDetailsPageState();
}

class _CxDetailsPageState extends State<CxDetailsPage> {
  String dropdownValue = '40001******0595';
  String yesORnoDropDownValue = "No";
  TextEditingController controller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController numcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Select Card Type',
            style: boldTextStyle(color: Colors.black, size: 20)),
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
            height: context.height(),
            width: context.width(),
            padding: EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // use this button to open the multi-select dialog
                        Text("Select Account number",
                            style: boldTextStyle(size: 15, color: black)),
                        DropdownButton<String>(
                          // Step 3.
                          icon: Icon(Icons.arrow_drop_down_circle_outlined),
                          isExpanded: true,
                          disabledHint: Text("Select"),
                          //dropdownColor: Color.fromARGB(255, 99, 185, 255),

                          value: dropdownValue,
                          // Step 4.
                          items: <String>[
                            '40001******0595',
                            '40001******0603',
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
                        10.height,
                        Text('Customer Name',
                            style: boldTextStyle(size: 15, color: black)),
                        AppTextField(
                          controller: controller,
                          autoFocus: false,
                          //textAlign: TextAlign.center,
                          textFieldType: TextFieldType.OTHER,
                          keyboardType: TextInputType.name,
                          textStyle: TextStyle(fontSize: 15, color: black),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5))),
                          ),
                        ).paddingOnly(/*left: 16,*/ right: 16),
                        10.height,
                        Text(
                            'Was your previous card linked to any other account?',
                            style: boldTextStyle(size: 15, color: black)),
                        DropdownButton<String>(
                          // Step 3.
                          icon: Icon(Icons.arrow_drop_down_circle_outlined),
                          isExpanded: true,
                          disabledHint: Text("Select"),
                          //dropdownColor: Color.fromARGB(255, 99, 185, 255),

                          value: yesORnoDropDownValue,
                          // Step 4.
                          items: <String>[
                            'No',
                            'Yes',
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
                              yesORnoDropDownValue = newValue!;
                            });
                          },
                        ),
                        10.height,
                        Text('Communication Address',
                            style: boldTextStyle(size: 15, color: black)),
                        AppTextField(
                          controller: addresscontroller,
                          autoFocus: false,
                          //textAlign: TextAlign.center,
                          textFieldType: TextFieldType.OTHER,
                          keyboardType: TextInputType.streetAddress,
                          textStyle: TextStyle(fontSize: 15, color: black),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5))),
                          ),
                        ).paddingOnly(/*left: 16,*/ right: 16),
                        10.height,
                        Text('Mobile Number',
                            style: boldTextStyle(size: 15, color: black)),
                        AppTextField(
                          controller: numcontroller,
                          autoFocus: false,
                          //textAlign: TextAlign.center,
                          textFieldType: TextFieldType.OTHER,
                          keyboardType: TextInputType.number,
                          textStyle: TextStyle(fontSize: 15, color: black),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5))),
                          ),
                        ).paddingOnly(/*left: 16,*/ right: 16),
                        10.height,
                        Text('Email Id',
                            style: boldTextStyle(size: 15, color: black)),
                        AppTextField(
                          controller: emailcontroller,
                          autoFocus: false,
                          //textAlign: TextAlign.center,
                          textFieldType: TextFieldType.OTHER,
                          keyboardType: TextInputType.emailAddress,
                          textStyle: TextStyle(fontSize: 15, color: black),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5))),
                          ),
                        ).paddingOnly(/*left: 16,*/ right: 16),

                        10.height,

                        ElevatedButton(
                                onPressed: () {
                                  //CxDetailsPage().launch(context);
                                },
                                child: const Text('Submit'))
                            .center()
                      ],
                    ),
                  ),
                ),
              ),
            )).paddingAll(0),
      ),
    );
  }
}
