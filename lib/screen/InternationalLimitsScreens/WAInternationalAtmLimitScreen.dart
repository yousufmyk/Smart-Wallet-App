import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../Controllers/limitController.dart';
import '../../../../dashboard/smart_home/models/smart_home_info_model.dart';
import '../../../../dashboard/smart_home/utils/colors.dart';
import '../../../../main.dart';
import '../../../../dashboard/smart_home/utils/constant.dart';
import '../../../../utils/fluid_slider_screen.dart';
import '../../../../utils/flutter_fluid_slider.dart';

class AtmInternationalLimitComponent extends StatefulWidget {
  

  @override
  _AtmInternationalLimitComponentState createState() =>
      _AtmInternationalLimitComponentState();
}

class _AtmInternationalLimitComponentState
    extends State<AtmInternationalLimitComponent> {
  double value = 10.0;
  final controller = Get.put(LimitsController());

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
                  value: false,
                  thumbColor: primaryHomeColor1,
                  activeColor: primaryHomeColor1.withOpacity(0.4),
                  trackColor: primaryHomeColor1.withOpacity(0.4),
                  onChanged: (value) {
                    // widget.deviceData.deviceToggle = !widget.deviceData.deviceToggle!;
                    setState(() {});
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
                      controller.AtmInternationalLimitValue = newValue;
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
