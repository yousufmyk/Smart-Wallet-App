import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wallet_app/main.dart';
import 'package:wallet_app/utils/WAColors.dart';
import '../utils/WAWidgets.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class AddressUpdateScreen extends StatefulWidget {
  const AddressUpdateScreen({Key? key}) : super(key: key);

  @override
  State<AddressUpdateScreen> createState() => _AddressUpdateScreenState();
}

class _AddressUpdateScreenState extends State<AddressUpdateScreen> {
  FocusNode AddressLineOneFocusNode = FocusNode();
  FocusNode AddressLineTwoFocusNode = FocusNode();
  FocusNode CityFocusNode = FocusNode();
  FocusNode CountryFocusNode = FocusNode();
  FocusNode ZipCodeFocusNode = FocusNode();

  String value = "Select";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Address Update',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('Address line 1',
                      style: boldTextStyle(size: 18, color: black))
                  .paddingLeft(16),
              AppTextField(
                autoFocus: true,
                decoration: waInputDecoration(
                  //hint: "Enter Beneficiary 's name here",
                  bgColor: context.cardColor,
                  borderColor: Colors.grey,
                ),
                textFieldType: TextFieldType.NAME,
                keyboardType: TextInputType.streetAddress,
                // controller: controller.receiptsNameController,
                focus: AddressLineTwoFocusNode,
                nextFocus: AddressLineTwoFocusNode,
              ).paddingOnly(left: 16, right: 16, bottom: 16),
              16.height,
              Text('Address line 2',
                      style: boldTextStyle(size: 18, color: black))
                  .paddingLeft(16),
              AppTextField(
                autoFocus: false,
                decoration: waInputDecoration(
                  //hint: "Enter Beneficiary 's name here",
                  bgColor: context.cardColor,
                  borderColor: Colors.grey,
                ),
                textFieldType: TextFieldType.NAME,
                keyboardType: TextInputType.streetAddress,
                // controller: controller.receiptsNameController,
                // focus: receiptNameFocusNode,
                nextFocus: CityFocusNode,
              ).paddingOnly(left: 16, right: 16, bottom: 16),
              16.height,
              Text('City', style: boldTextStyle(size: 18, color: black))
                  .paddingLeft(16),
              AppTextField(
                autoFocus: false,
                decoration: waInputDecoration(
                  //hint: "Enter Beneficiary 's name here",
                  bgColor: context.cardColor,
                  borderColor: Colors.grey,
                ),
                textFieldType: TextFieldType.NAME,
                keyboardType: TextInputType.name,
                // controller: controller.receiptsNameController,
                // focus: receiptNameFocusNode,
                nextFocus: CountryFocusNode,
              ).paddingOnly(left: 16, right: 16, bottom: 16),
              16.height,
              Text('Country', style: boldTextStyle(size: 18, color: black))
                  .paddingLeft(16),
              AppTextField(
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
                      print('Select country: ${country.displayName}');

                      setState(() {
                        value = country.displayNameNoCountryCode;
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
                            color: const Color(0xFF8C98A8).withOpacity(0.2),
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

                controller: TextEditingController(text: value),
                decoration: waInputDecoration(
                  //hint: "Enter Beneficiary 's name here",
                  bgColor: context.cardColor,
                  borderColor: Colors.grey,
                ),
                textFieldType: TextFieldType.NAME,
                keyboardType: TextInputType.name,
                // controller: controller.receiptsNameController,
                // focus: receiptNameFocusNode,
                nextFocus: ZipCodeFocusNode,
              ).paddingOnly(left: 16, right: 16, bottom: 16),
              16.height,
              Text('Zip / Postcode',
                      style: boldTextStyle(size: 18, color: black))
                  .paddingLeft(16),
              AppTextField(
                autoFocus: false,
                decoration: waInputDecoration(
                  //hint: "Enter Beneficiary 's name here",
                  bgColor: context.cardColor,
                  borderColor: Colors.grey,
                ),
                textFieldType: TextFieldType.NAME,
                keyboardType: TextInputType.number,
                // controller: controller.receiptsNameController,
                //focus: receiptNameFocusNode,
                // nextFocus: accountFocusNode,
              ).paddingOnly(left: 16, right: 16, bottom: 16),
              AppButton(
                        color: WAPrimaryColor,
                        width: context.width(),
                        child: Text('Done',
                            style: boldTextStyle(color: Colors.white)),
                        onTap: () {
                          _onAlertButtonsPressed(context);
                    //       showInDialog(context, builder: (context) {
                    //   //return WAEditProfileDialog(data: data,);
                    // });
                        },
                      ).cornerRadiusWithClipRRect(30).paddingOnly(
                          left: context.width() * 0.1,
                          right: context.width() * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}

_onAlertButtonsPressed(context) {
  //final CreditCardModel data;
  
  Alert(
      context: context,
      //type: AlertType.warning,
      type: AlertType.success,
      title: 'Done',
      desc: 'Your Address has been sucessfully updated',
      buttons: [
        DialogButton(
          // onPressed: () {
          //   //  WADashboardScreen(
          //   //     data: data,
          //   //   ).launch(context);
          // },
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            'Ok',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        // DialogButton(
        //   onPressed: () => Navigator.pop(context),
        //   gradient: const LinearGradient(colors: [
        //     Color.fromRGBO(116, 116, 191, 1.0),
        //     Color.fromRGBO(52, 138, 199, 1.0),
        //   ]),
        //   child: const Text(
        //     'GRADIENT',
        //     style: TextStyle(color: Colors.white, fontSize: 18),
        //   ),
        // )
      ]).show();
}
