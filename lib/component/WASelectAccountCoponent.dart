import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class DropdownCardSelect extends StatefulWidget {
  const DropdownCardSelect({Key? key}) : super(key: key);
  @override
  State<DropdownCardSelect> createState() => _DropdownCardSelectState();
}
class _DropdownCardSelectState extends State<DropdownCardSelect> {
  String dropdownValue = '40001******0595';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              // Step 2.
              DropdownButton<String>(
                // Step 3.
                value: dropdownValue,
                // Step 4.
                items: <String>['40001******0595', '40001******0603',]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                }).toList(),
                // Step 5.
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}