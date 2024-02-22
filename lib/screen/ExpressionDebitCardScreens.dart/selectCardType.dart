import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:http/http.dart' as http;

// import '../../component/WAAcceptT&CcheckBoxComponent.dart';
import '../../main.dart';
import 'diffCardandChargesScreen.dart';

class SelectCardsScreen extends StatefulWidget {
  const SelectCardsScreen({Key? key}) : super(key: key);

  @override
  State<SelectCardsScreen> createState() => _SelectCardsScreenState();
}

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

enum CustomCardsTyp {
  Card1,
  Card2,
  Card3,
  Card4,
  Card5,
  
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

 

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select background'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

class _SelectCardsScreenState extends State<SelectCardsScreen> {
  List<String> _selectedItems = [];
   CustomCardsTyp? _card = CustomCardsTyp.Card1;

  void _showMultiSelect() async {
    
    final List<String> items = [
      'Statue of Liberty',
      'Dubai skyscraper',
      'Los Angeles',
      'Bitcoin',
      'Classic',
     
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );
    

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

     void _doSomething() {
    // Do something
    SelectCardAndCharges().launch(context);
    //SelectCardsScreen().launch(context);
  }
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Expression Debit/Credit card',
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
            padding: EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // use this button to open the multi-select dialog
                    ElevatedButton(
                      onPressed: _showMultiSelect,
                      child: const Text('Select Your Favorite Card Background'),
                    ),
                    const Divider(
                      height: 30,
                    ),
                    // display selected items
                    Wrap(
                      children: _selectedItems
                          .map((e) => Chip(
                                label: Text(e),
                              ))
                          .toList(),
                    ),
              
                    RadioListTile<CustomCardsTyp>(
                                title: Image.asset("images/mobile_banking/Capture5-removebg-preview (1).png"),
                                value: CustomCardsTyp.Card1,
                                groupValue: _card,
                                onChanged: (CustomCardsTyp? value) {
                                  setState(() {
                                    _card = value;
                                  });
                                },
                              ),
                              RadioListTile<CustomCardsTyp>(
                                title: Image.asset("images/mobile_banking/Capture4-removebg-preview (1).png"),
                                value: CustomCardsTyp.Card2,
                                groupValue: _card,
                                onChanged: (CustomCardsTyp? value) {
                                  setState(() {
                                    _card = value;
                                  });
                                },
                              ),
                              RadioListTile<CustomCardsTyp>(
                                title: Image.asset("images/mobile_banking/Capture3-removebg-preview (1).png"),
                                value: CustomCardsTyp.Card3,
                                groupValue: _card,
                                onChanged: (CustomCardsTyp? value) {
                                  setState(() {
                                    _card = value;
                                  });
                                },
                              ),
                              RadioListTile<CustomCardsTyp>(
                                title: Image.asset("images/mobile_banking/Capture2-removebg-preview (1).png"),
                                value: CustomCardsTyp.Card4,
                                groupValue: _card,
                                onChanged: (CustomCardsTyp? value) {
                                  setState(() {
                                    _card = value;
                                  });
                                },
                              ),
                              RadioListTile<CustomCardsTyp>(
                                title: Image.asset("images/mobile_banking/Capture1-removebg-preview (1).png"),
                                value: CustomCardsTyp.Card5,
                                groupValue: _card,
                                onChanged: (CustomCardsTyp? value) {
                                  setState(() {
                                    _card = value;
                                  });
                                },
                              ),
              
                    50.height,
              
                     Center(
                       child: ElevatedButton(
                                 onPressed: _doSomething,
                                 child: const Text('Submit')),
                     )
                  ],
                ),
              ),
            )).paddingAll(0),
      ),
    );
  }
}
