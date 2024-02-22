import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//This is the container wiget that contains all the credit card widget

class CardWidget extends StatelessWidget {
  CardWidget({
    Key? key,
    required this.cardValue,
    required this.expiryValue,
    required this.cvvValue,
    required this.nameOnCardValue,
    required this.onpressed,
    this.organizationName,
    this.organizationLogo,
    this.oraganizationNamecolor,
    this.amount,
    this.vat,
    this.totalAmount,
  }) : super(key: key);

  final TextEditingController? cardValue;
  final TextEditingController? expiryValue;
  final TextEditingController? cvvValue;
  final TextEditingController? nameOnCardValue;
  final String? organizationName;
  final AssetImage? organizationLogo;
  final Color? oraganizationNamecolor;
  final String? amount;
  final String? vat;
  final String? totalAmount;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mediaQuerySize.width,
      height: 520,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  cursorColor: Color.fromARGB(197, 161, 10, 131),
                  style: TextStyle(color: Colors.grey),
                  controller: cardValue,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.credit_card,
                        color: Color.fromARGB(197, 161, 10, 131),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 185, 185, 185))),
                      labelText: 'Card Number',
                      hintText: '1234 1234 1234 1234',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Image(
                image: AssetImage('images/mobile_banking/cardsLogo.png'),
                height: 50,
                width: 100,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  cursorColor: Color.fromARGB(197, 161, 10, 131),
                  style: TextStyle(color: Colors.grey),
                  controller: expiryValue,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.date_range_rounded,
                        color: Color.fromARGB(197, 161, 10, 131),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 185, 185, 185))),
                      labelText: "Expiry Date",
                      hintText: 'MM / YY',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  obscureText: true,
                  obscuringCharacter: "•",
                  cursorColor: Color.fromARGB(197, 161, 10, 131),
                  style: TextStyle(color: Colors.grey),
                  maxLength: 3,
                  controller: cvvValue,
                  decoration: InputDecoration(
                      counterText: '',
                      icon: Icon(
                        Icons.pin,
                        color: Color.fromARGB(197, 161, 10, 131),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 185, 185, 185))),
                      labelText: 'CVV',
                      hintText: '* * *',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.grey)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            cursorColor: Color.fromARGB(197, 161, 10, 131),
            style: TextStyle(color: Colors.grey),
            controller: nameOnCardValue,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Color.fromARGB(197, 161, 10, 131),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 185, 185, 185))),
                labelText: 'Name on card',
                enabledBorder: InputBorder.none,
                labelStyle: TextStyle(color: Colors.grey)),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: onpressed,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 103, 255, 108)),
              child: const Text(
                'Done',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
