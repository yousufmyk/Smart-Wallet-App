import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../Controllers/limitController.dart';
import '../../../../dashboard/smart_home/models/smart_home_info_model.dart';
import '../../../../dashboard/smart_home/utils/colors.dart';
import '../../../../main.dart';
import '../../../../dashboard/smart_home/utils/constant.dart';
import '../../../../utils/fluid_slider_screen.dart';
import '../../../../utils/flutter_fluid_slider.dart';
import 'package:http/http.dart' as http;
import 'globalValuesForLimits.dart' as global;

class AtmDomesticLimitComponent extends StatefulWidget {
  
  @override
  _AtmDomesticLimitComponentState createState() =>
      _AtmDomesticLimitComponentState();
}

class _AtmDomesticLimitComponentState extends State<AtmDomesticLimitComponent> {
   getLimit() async {
      
    var token = await SessionManager().get("token");
    final response = await http.get(
      Uri.parse(
          'http://sandboxdev.omaemirates.com:9501/NanoCMS/v1/nanocms/getCardInfo/OMA/OMA0000000000265'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    
    if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        var cardinfo = (data as Map)['cardInfo'];
        var primaryCardInfo = (cardinfo as Map)['primaryCardInfo'];
        var atm = (primaryCardInfo as Map)['atm'];
        final maxAount = (atm as Map)['maxAmount'];
        return{
          global.globalAtmDomesticValue = maxAount.toString().toDouble()
        };
         
        //print("${maxAmount} this one is the api response");

    } else {
      print("error: ATM Limit Api is not working");
    }
  }

  var value = global.globalAtmDomesticValue;
  final controller = Get.put(LimitsController());

  @override
  void initState() {
    super.initState();
    init();
    getLimit();
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
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: appStore.isDarkModeOn
                ? Colors.white.withOpacity(0.2)
                : Colors.white.withOpacity(0.5),
            borderRadius: radius(DEFAULT_RADIUS),
          ),
          child: Column(
            children: [
              ListTile(
                horizontalTitleGap: 8,
                title: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('ATM', style: primaryTextStyle(size: 18)),
                ),
                subtitle: RichText(
                  text: TextSpan(
                      
                      ),
                ),
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      shape: BoxShape.circle),
                  child: Image.asset("images/mobile_banking/atm.png"),
                ),
                trailing: CupertinoSwitch(
                  value: true,
                  thumbColor: primaryHomeColor1,
                  activeColor: primaryHomeColor1.withOpacity(0.4),
                  trackColor: primaryHomeColor1.withOpacity(0.4),
                  onChanged: (value) {
                    // widget.deviceData.deviceToggle = !widget.deviceData.deviceToggle!;
                    setState(() {
                      
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: FluidSlider(
                  start: Text('0', style: primaryTextStyle(color: white)),
                  end: Text('100', style: primaryTextStyle(color: white)),
                  value: value,
                  labelsTextStyle: primaryTextStyle(),
                  valueTextStyle: primaryTextStyle(color: textPrimaryColor),
                  onChanged: (double newValue) {
                    setState(() {
                     value = newValue;
                      controller.AtmDomesticLimitValue = newValue;
                    });
                  },
                  min: 0.0,
                  max: 100.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
