import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/utils/WAColors.dart';
import 'package:wallet_app/utils/WAWidgets.dart';


import '../component/WAAccoutProfileUpdatedailogComponent.dart';

import '../component/WALinkBankAccountDailog.dart';
import '../component/WAPickProfilePic.dart';
import '../main.dart';
import '../model/cardDetailsModel.dart';
import 'WAAddCreditionalScreen.dart';

class WALinkBankAcScreen extends StatefulWidget {
  // final CreditCardModel data;
  // const WALinkBankAcScreen({Key? key, required this.data, this.isEditProfile})
  //     : assert(data != null),
  //       super(key: key);
  static String tag = '/WALinkBankAcScreen';
  // final isEditProfile;

  // WAEditProfileScreen({this.isEditProfile});

  @override
  WALinkBankAcScreenState createState() => WALinkBankAcScreenState(/*data: data*/);
}

class WALinkBankAcScreenState extends State<WALinkBankAcScreen> {
  // WALinkBankAcScreenState({
  //   required this.data,
  // }) : assert(data != null);
  // final CreditCardModel data;
  //var fullNameController = TextEditingController();
  //var contactNumberController = TextEditingController();
  var acHolderNameContoller = TextEditingController();
  var bankNameController = TextEditingController();
  var branchNameContoller = TextEditingController();
  var ibanContoller = TextEditingController();

  FocusNode acHolderNameFoucs = FocusNode();
  FocusNode bankNameFocus = FocusNode();
  FocusNode branchNameFocus = FocusNode();
  FocusNode ibanFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
    super.dispose();
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Link Bank Account',
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
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                //margin: EdgeInsets.only(top: 80),
                padding:
                    EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
                width: context.width(),
                height: context.height(),
                decoration: boxDecorationWithShadow(
                    backgroundColor: context.cardColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Intently Link Your Bank Account',
                          style: boldTextStyle(size: 18)),
                      16.height,
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.2),
                                width: 0.5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Account Holder Name',
                                style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                hint: 'Enter Account Holder Name here',
                              ),
                              textFieldType: TextFieldType.NAME,
                              keyboardType: TextInputType.name,
                              controller: acHolderNameContoller,
                              focus: acHolderNameFoucs,
                            ),
                            16.height,
                            Text('Bank Name', style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                hint: 'Enter your bank name here',
                              ),
                              textFieldType: TextFieldType.PHONE,
                              keyboardType: TextInputType.phone,
                              controller: bankNameController,
                              focus: bankNameFocus,
                            ),
                            16.height,
                            Text('Branch Name', style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                hint: 'Enter your branch name here',
                              ),
                              textFieldType: TextFieldType.PHONE,
                              keyboardType: TextInputType.phone,
                              controller: branchNameContoller,
                              focus: branchNameFocus,
                            ),
                            16.height,
                            Text('IBAN Number', style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                hint: 'Enter your IBAN Numbers here',
                              ),
                              textFieldType: TextFieldType.PHONE,
                              keyboardType: TextInputType.phone,
                              controller: ibanContoller,
                              focus: ibanFocus,
                            ),
                          ],
                        ),
                      ),
                      16.height,
                      AppButton(
                        color: WAPrimaryColor,
                        width: context.width(),
                        child: Text('Done',
                            style: boldTextStyle(color: Colors.white)),
                        onTap: () {
                          showInDialog(context, builder: (context) {
                            return LinkBankAccountDialog(
                              /*data: data,*/
                            );
                          });
                        },
                      ).cornerRadiusWithClipRRect(30).paddingOnly(
                          left: context.width() * 0.1,
                          right: context.width() * 0.1),
                    ],
                  ),
                ),
              ),
            ],
          ).paddingTop(60),
        ),
      ),
    );
  }
}
