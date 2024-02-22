import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screen/ExpressionDebitCardScreens.dart/selectCardType.dart';

class WATandCcomponent extends StatefulWidget {
  const WATandCcomponent({Key? key}) : super(key: key);

  @override
  State<WATandCcomponent> createState() => _WATandCcomponentState();
}

class _WATandCcomponentState extends State<WATandCcomponent> {
  // By defaut, the checkbox is unchecked and "agree" is "false"
  bool agree = false;

  // This function is triggered when the button is clicked
  void _doSomething() {
    // Do something

    SelectCardsScreen().launch(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            Material(
              child: Checkbox(
                value: agree,
                onChanged: (value) {
                  setState(() {
                    agree = value ?? false;
                  });
                },
              ),
            ),
            const Text(
              'I have read and accept terms and conditions',
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        ElevatedButton(
            onPressed: agree ? _doSomething : null,
            child: const Text('Choose from Design Gallery'))
      ]),
    );
  }
}
