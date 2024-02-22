
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class WASubmitLimitButton extends StatelessWidget {
  const WASubmitLimitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _limitssubmitButttonPressedButtonsPressed(context);
  }

  _limitssubmitButttonPressedButtonsPressed(context) {
    Alert(
        context: context,
        //type: AlertType.warning,
        type: AlertType.success,
        title: 'Submitted Sucessfully',
        desc: 'Our team will review your limits and get back to you shortly',
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            color: const Color.fromRGBO(0, 179, 134, 1.0),
            child: Text(
              'OK',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          
        ]).show();
  }
}
