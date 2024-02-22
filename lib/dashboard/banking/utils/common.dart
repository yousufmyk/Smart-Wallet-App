import 'package:flutter/cupertino.dart';
import '../../../dashboard/banking/utils/colors.dart';

Gradient primaryLinearGradient() {
  return LinearGradient(
    colors: [primaryBankingColor2, primaryBankingColor1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
