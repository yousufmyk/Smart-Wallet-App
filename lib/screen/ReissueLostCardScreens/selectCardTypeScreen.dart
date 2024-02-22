import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';
import 'CxDetialsScreen.dart';

class SelectNewCardAndCharges extends StatefulWidget {
  const SelectNewCardAndCharges({Key? key}) : super(key: key);

  @override
  State<SelectNewCardAndCharges> createState() =>
      _SelectNewCardAndChargesState();
}

enum CardsTyp {
  CoralPaywaveDebitCard,
  CoralPlusDebitCard,
  RubyxDebitCard,
  SapphiroDebitCard
}

/// private State class that goes with MyStatefulWidget
class _SelectNewCardAndChargesState extends State<SelectNewCardAndCharges> {
  CardsTyp? _card = CardsTyp.CoralPaywaveDebitCard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Select Card Type',
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
        //brightness: Brightness.dark,
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
                              title: const Text('Coral Paywave Debit Card'),
                              value: CardsTyp.CoralPaywaveDebitCard,
                              groupValue: _card,
                              onChanged: (CardsTyp? value) {
                                setState(() {
                                  _card = value;
                                });
                              },
                            ),
                            RadioListTile<CardsTyp>(
                              title: const Text('Coral Plus Debit Card'),
                              value: CardsTyp.CoralPlusDebitCard,
                              groupValue: _card,
                              onChanged: (CardsTyp? value) {
                                setState(() {
                                  _card = value;
                                });
                              },
                            ),
                            RadioListTile<CardsTyp>(
                              title: const Text('Rubyx Debit Card'),
                              value: CardsTyp.RubyxDebitCard,
                              groupValue: _card,
                              onChanged: (CardsTyp? value) {
                                setState(() {
                                  _card = value;
                                });
                              },
                            ),
                            RadioListTile<CardsTyp>(
                              title: const Text('Sapphiro Debit Card'),
                              value: CardsTyp.SapphiroDebitCard,
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

                ElevatedButton(
                        onPressed: () {
                          CxDetailsPage().launch(context);
                        },
                        child: const Text('Proceed'))
                    .center()
              ],
            ),
          )).paddingAll(0),
    );
  }
}
