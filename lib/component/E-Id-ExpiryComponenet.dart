import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/WAWidgets.dart';

class ExpiryTextFeilds extends StatefulWidget {
  const ExpiryTextFeilds({Key? key}) : super(key: key);

  @override
  State<ExpiryTextFeilds> createState() => _ExpiryTextFeildsState();
}

class _ExpiryTextFeildsState extends State<ExpiryTextFeilds> {
  TextEditingController dateOfIsuue = TextEditingController();
  TextEditingController dateOfExp = TextEditingController();
  FocusNode dateOfIsuueFocus = FocusNode();
  FocusNode dateOfExpFoucs = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          
          8.height,
          Expanded(
            child: AppTextField(
              decoration: waInputDecoration(
                  hint: 'DD-MM-YYYY', prefixIcon: Icons.date_range_outlined),
              textFieldType: TextFieldType.EMAIL,
              keyboardType: TextInputType.number,
              controller: dateOfIsuue,
              focus: dateOfIsuueFocus,
              nextFocus: dateOfExpFoucs,
            ),
          ),
          Text("Expiry Date", style: boldTextStyle(size: 14)),
          8.height,
          Expanded(
            child: AppTextField(
              decoration: waInputDecoration(
                  hint: 'DD-MM-YYYY', prefixIcon: Icons.date_range_outlined),
              textFieldType: TextFieldType.EMAIL,
              keyboardType: TextInputType.number,
              controller: dateOfExp,
              focus: dateOfExpFoucs,
              // nextFocus: dateOfExpFoucs,
            ),
          ),
        ],
      ),
    );
  }
}


