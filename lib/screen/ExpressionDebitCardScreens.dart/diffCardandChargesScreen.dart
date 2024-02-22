import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';

class SelectCardAndCharges extends StatefulWidget {
  const SelectCardAndCharges({Key? key}) : super(key: key);

  @override
  State<SelectCardAndCharges> createState() => _SelectCardAndChargesState();
}

enum CardsTyp {
  ExpressionsDebitCard,
  ExpressionsWaveDebitCard,
  ExpressionsCoralDebitCard,
  ExpressionsSapphiroDebitCard
}

/// private State class that goes with MyStatefulWidget
class _SelectCardAndChargesState extends State<SelectCardAndCharges> {
  CardsTyp? _card = CardsTyp.ExpressionsDebitCard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Expression Debit/Credit card Type',
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
        ////brightness: Brightness.dark,
      ),
      body: Container(
          height: context.height(),
          width: context.width(),
          padding: EdgeInsets.only(top: 0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // use this button to open the multi-select dialog
                Container(
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          children: <Widget>[
                            RadioListTile<CardsTyp>(
                              title: const Text('Expressions Debit Card'),
                              value: CardsTyp.ExpressionsDebitCard,
                              groupValue: _card,
                              onChanged: (CardsTyp? value) {
                                setState(() {
                                  _card = value;
                                });
                              },
                            ),
                            RadioListTile<CardsTyp>(
                              title: const Text('Expressions Wave Debit Card'),
                              value: CardsTyp.ExpressionsWaveDebitCard,
                              groupValue: _card,
                              onChanged: (CardsTyp? value) {
                                setState(() {
                                  _card = value;
                                });
                              },
                            ),
                            RadioListTile<CardsTyp>(
                              title: const Text('Expressions Coral Debit Card'),
                              value: CardsTyp.ExpressionsCoralDebitCard,
                              groupValue: _card,
                              onChanged: (CardsTyp? value) {
                                setState(() {
                                  _card = value;
                                });
                              },
                            ),
                            RadioListTile<CardsTyp>(
                              title:
                                  const Text('Expressions Sapphiro Debit Card'),
                              value: CardsTyp.ExpressionsSapphiroDebitCard,
                              groupValue: _card,
                              onChanged: (CardsTyp? value) {
                                setState(() {
                                  _card = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                10.height,
                Text("Basic Features & Charges : ",
                    style: boldTextStyle(
                        color: Color.fromARGB(255, 185, 64, 57), size: 20)),

                Text(
                    "• Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                    style: boldTextStyle(color: Colors.black, size: 15)),
                5.height,
                Text("• Vivamus quis enim quis sem tristique fermentum.",
                    style: boldTextStyle(color: Colors.black, size: 15)),
                5.height,
                Text("• Aliquam aliquet mi non viverra maximus.",
                    style: boldTextStyle(color: Colors.black, size: 15)),
                5.height,
                Text("• Suspendisse vitae sem eget tellus pharetra tincidunt.",
                    style: boldTextStyle(color: Colors.black, size: 15)),
                5.height,
                Text("• Morbi faucibus risus vitae turpis molestie porttitor.",
                    style: boldTextStyle(color: Colors.black, size: 15)),

                10.height,

                ElevatedButton(onPressed: () {}, child: const Text('Proceed')).center()
              ],
            ),
          )).paddingAll(0),
    );
  }
}
