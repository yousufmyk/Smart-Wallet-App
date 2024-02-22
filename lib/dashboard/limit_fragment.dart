import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
// import 'package:mobile_banking/Controllers/limitController.dart';
// import 'package:mobile_banking/screen/DomesticLimitsScreens/WADomesticE-comLimitScreen.dart';
// import 'package:mobile_banking/screen/DomesticLimitsScreens/WADomesticPosLimitScreen.dart';
// import 'package:mobile_banking/screen/DomesticLimitsScreens/WADomesticNetworkLimitScreen.dart';
// import 'package:mobile_banking/screen/InternationalLimitsScreens/WAInternationalAtmLimitScreen.dart';
// import 'package:mobile_banking/screen/InternationalLimitsScreens/WAInternationalE-comLimitScreen.dart';
// import 'package:mobile_banking/screen/InternationalLimitsScreens/WAInternationalNetworkLimitScreen.dart';
// import 'package:mobile_banking/screen/InternationalLimitsScreens/WAInternationalPosLimitScreen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/Controllers/limitController.dart';
import 'package:wallet_app/screen/DomesticLimitsScreens/WADomesticE-comLimitScreen.dart';
import 'package:wallet_app/screen/DomesticLimitsScreens/WADomesticNetworkLimitScreen.dart';
import 'package:wallet_app/screen/DomesticLimitsScreens/WADomesticPosLimitScreen.dart';
import 'package:wallet_app/screen/InternationalLimitsScreens/WAInternationalAtmLimitScreen.dart';
import 'package:wallet_app/screen/InternationalLimitsScreens/WAInternationalE-comLimitScreen.dart';
import 'package:wallet_app/screen/InternationalLimitsScreens/WAInternationalNetworkLimitScreen.dart';
import 'package:wallet_app/screen/InternationalLimitsScreens/WAInternationalPosLimitScreen.dart';
import 'package:wallet_app/utils/widgets/slider.dart';
import '../../../dashboard/smart_home/component/devices_component.dart';
import '../../../dashboard/smart_home/component/rooms_component.dart';
import '../../../dashboard/smart_home/component/usage_history_component.dart';
import '../../../dashboard/smart_home/models/smart_home_info_model.dart';
import '../../../dashboard/smart_home/utils/colors.dart';
import '../../../dashboard/smart_home/utils/common.dart';
import '../../../dashboard/smart_home/utils/images.dart';
import '../component/WALimitSubmitButtonDailog.dart';
import '../component/WAMoneyTransferCompeteDialog.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../../../dashboard/smart_home/utils/constant.dart';
import '../model/cardDetailsModel.dart';
import '../screen/DomesticLimitsScreens/WADomesticAtmLimitScreen.dart';
// import '../screen/ExpressionDebitCardScreens.dart/terms&condionScreen.dart';
import '../screen/ReissueLostCardScreens/selectCardTypeScreen.dart';
import '../utils/WAColors.dart';
// import 'package:slider_button/slider_button.dart';

class LimitFragment extends StatefulWidget {
  final CreditCardModel data;

  //var futureList;
  const LimitFragment({
    Key? key,
    required this.data,
    //required this.futureList,
  })  : assert(data != null),
        super(key: key);

  @override
  _LimitFragmentState createState() => _LimitFragmentState(data: data);
}

class _LimitFragmentState extends State<LimitFragment> {
  _LimitFragmentState({
    required this.data,
    //required this.futureList,
  }) : assert(data != null);
  final CreditCardModel data;
  List<SmartHomeInfoModel> setUsageHistoryDetail = getUsageHistoryList();
  List<SmartHomeInfoModel> setRoomsDetail = getRoomsInfoList();
  List<SmartHomeInfoModel> setDevicesDetail = getDevicesInfoList();
  final controller = Get.put(LimitsController());

  Future atmlimitUpdate() async {
    var token = await SessionManager().get("token");
    final controller = await Get.put(LimitsController());
    final valueAtmLimit =
        await controller.AtmDomesticLimitValue.round().toString();
    final valueposLimit =
        await controller.PosDomesticLimitValue.round().toString();
    final valueEcomLimit =
        await controller.E_ComDomesticLimitValue.round().toString();
    final valueNWLimit =
        await controller.NetWorkDomesticLimitValue.round().toString();

    final response = await http.post(
      Uri.parse(
          'http://sandboxdev.omaemirates.com:9501/NanoCMS/v1/nanocms/addOrUpdateCardLimit/OMA/OMA0000000000265'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        "cardService": "ADDORUPDATELIMITID",
        "thresholdAmount": "10000",
        "domesticTrans": "true",
        "internationalTrans": "true",
        "atmMinAmount": "10",
        "atmMaxAmount": valueAtmLimit,
        "posMinAmount": "10",
        "posMaxAmount": valueposLimit,
        "ecomMinAmount": "10",
        "ecomMaxAmount": valueEcomLimit,
        "nwMinAmount": "10",
        "nwMaxAmount": valueNWLimit
      }),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print("ATM Limit updated sucessfully");
    } else {
      print(response.statusCode);
      print("there is some error in ATM Limit updated Api");
    }
  }

  Future poslimitUpdate() async {
    var token = await SessionManager().get("token");
    final controller = await Get.put(LimitsController());
    final value = await controller.PosDomesticLimitValue.round().toString();

    final response = await http.post(
      Uri.parse(
          'http://10.0.33.190:8083/NanoConfig/v1/smartBanking/addOrUpdateLimitId/VISA'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        "cardService": "ADDORUPDATELIMITID",
        "limitId": "VISA",
        "channelType": "POS",
        "tranType": "ALL",
        "minAmount": "10",
        "maxAmount": value,
        "description": "VISA",
        "status": "true"
      }),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print("POS Limit updated sucessfully");
    } else {
      print(response.statusCode);
      print("there is some error in POS Limit updated Api");
    }
  }

  Future ecomlimitUpdate() async {
    var token = await SessionManager().get("token");
    final controller = await Get.put(LimitsController());
    final value = await controller.E_ComDomesticLimitValue.round().toString();

    final response = await http.post(
      Uri.parse(
          'http://10.0.33.190:8083/NanoConfig/v1/smartBanking/addOrUpdateLimitId/VISA'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        "cardService": "ADDORUPDATELIMITID",
        "limitId": "VISA",
        "channelType": "E-Com",
        "tranType": "ALL",
        "minAmount": "10",
        "maxAmount": value,
        "description": "VISA",
        "status": "true"
      }),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print("E-Com Limit updated sucessfully");
    } else {
      print(response.statusCode);
      print("there is some error in E-Com Limit updated Api");
    }
  }

  Future networklimitUpdate() async {
    var token = await SessionManager().get("token");
    final controller = await Get.put(LimitsController());
    final value = await controller.NetWorkDomesticLimitValue.round().toString();

    final response = await http.post(
      Uri.parse(
          'http://10.0.33.190:8083/NanoConfig/v1/smartBanking/addOrUpdateLimitId/VISA'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        "cardService": "ADDORUPDATELIMITID",
        "limitId": "VISA",
        "channelType": "Network",
        "tranType": "ALL",
        "minAmount": "10",
        "maxAmount": value,
        "description": "VISA",
        "status": "true"
      }),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print("Network Limit updated sucessfully");
    } else {
      print(response.statusCode);
      print("there is some error in Network Limit updated Api");
    }
  }

  @override
  void initState() {
    super.initState();
    init();
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
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            elevation: 0,
            bottom: TabBar(
                labelColor: Colors.blueAccent,
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "DOMESTIC",
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("INTERNATIONAL"),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Wrap(
                    children: [
                      AtmDomesticLimitComponent(),
                      PosDomesticLimitComponent(),
                      E_ComDomesticLimitComponent(),
                      NetWorkDomesticLimitComponent(),
                    ],
                  ),
                  32.height,
                  SliderButton(
                    buttonSize: 50,
                    backgroundColor: WAPrimaryColor,
                    dismissible: true,
                    action: () async {
                      print(controller.AtmDomesticLimitValue.toString());
                      print(controller.PosDomesticLimitValue.toString());
                      await atmlimitUpdate();
                      // await poslimitUpdate();
                      // await ecomlimitUpdate();
                      // await networklimitUpdate();

                      ///Do something here
                      showInDialog(context, builder: (context) {
                        return WAPinChangeSubmiteDialog(data: data);
                      });
                    },
                    label:
                        Text("Swipe to Update Limit", style: boldTextStyle()),
                    icon: Icon(Icons.arrow_forward, color: WAPrimaryColor),
                  ).center(),
                  10.height,
                  SettingItemWidget(
                      title: 'Expressions Debit Card',
                      decoration: boxDecorationRoundedWithShadow(12,
                          backgroundColor: context.cardColor),
                      trailing:
                          Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                      onTap: () {
                        // TermsAndConditiionScreen().launch(context);
                      }),
                  5.height,
                  SettingItemWidget(
                      title: 'Reissue of lost ATM/Debit Card',
                      decoration: boxDecorationRoundedWithShadow(12,
                          backgroundColor: context.cardColor),
                      trailing:
                          Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                      onTap: () {
                        SelectNewCardAndCharges().launch(context);
                      }),
                ],
              ),
            ),
            Column(
              children: [
                Wrap(
                  children: [
                    AtmInternationalLimitComponent(),
                    PosInternationalLimitComponent(),
                    E_ComInternationalLimitComponent(),
                    NetWorkInternationalLimitComponent()
                  ],
                ),
                32.height,
                SliderButton(
                  buttonSize: 50,
                  backgroundColor: WAPrimaryColor,
                  dismissible: true,
                  action: () {
                    ///Do something here
                    showInDialog(context, builder: (context) {
                      return WAPinChangeSubmiteDialog(data: data);
                    });
                  },
                  label: Text("Swipe to Update Limit", style: boldTextStyle()),
                  icon: Icon(Icons.arrow_forward, color: WAPrimaryColor),
                ).center(),
              ],
            ),
          ]),
        ));
  }
}
