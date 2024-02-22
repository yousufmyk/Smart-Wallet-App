import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/WAColors.dart';

class WACardSwitchComponent extends StatefulWidget {
  const WACardSwitchComponent({Key? key}) : super(key: key);

  @override
  State<WACardSwitchComponent> createState() => _WACardSwitchComponentState();
}

class _WACardSwitchComponentState extends State<WACardSwitchComponent> {
  bool isSwitched = true;
  bool isonlineEnable = true;
  var textValue = 'Your Card is disabled';
  var textValueTwo = 'Online Transactions is disabled';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Your Card is enabled';
      });
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Your Card is disabled';
      });
    }
  }

  void secondtoggleSwitch(bool value) {
    if (isonlineEnable == false) {
      setState(() {
        isonlineEnable = true;
        textValueTwo = 'Online Transactions is enabled';
      });
    } else {
      setState(() {
        isonlineEnable = false;
        textValueTwo = 'Online Transactions is disabled';
      });
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SettingItemWidget(
              title: textValue,
              decoration: boxDecorationRoundedWithShadow(12,
                  backgroundColor: context.cardColor),
              trailing: Switch(
                onChanged: toggleSwitch,
                value: isSwitched,
                activeColor: Colors.white,
                activeTrackColor: Color.fromARGB(255, 74, 255, 80),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Color.fromARGB(255, 243, 89, 89),
              ),
              onTap: () {
                //
              }),
          SettingItemWidget(
              title: textValueTwo,
              decoration: boxDecorationRoundedWithShadow(12,
                  backgroundColor: context.cardColor),
              trailing: Switch(
                onChanged: secondtoggleSwitch,
                value: isonlineEnable,
                activeColor: Colors.white,
                activeTrackColor: Color.fromARGB(255, 74, 255, 80),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Color.fromARGB(255, 243, 89, 89),
              ),
              onTap: () {
                //
              }),
          16.height,
        ],
      ),
    );
  }
}
