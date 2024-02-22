//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/screen/WAHomeScreen.dart';
import 'package:wallet_app/screen/WAMyProfileScreen.dart';
import 'package:wallet_app/screen/WAQrScannerScreen.dart';
import 'package:wallet_app/screen/WAStatisticsScreen.dart';
import 'package:wallet_app/screen/WAWalletScreen.dart';
import 'package:wallet_app/utils/WAColors.dart';

import '../dashboard/dashboard_fragment.dart';
import '../model/cardDetailsModel.dart';

class WADashboardScreen extends StatefulWidget {
  // final CreditCardModel data;

  // //var futureList;
  // const WADashboardScreen({
  //   Key? key,
  //   required this.data,
  //   //required this.futureList,
  // })  : assert(data != null),
  //       super(key: key);

  static String tag = '/WADashboardScreen';

  @override
  WADashboardScreenState createState() => WADashboardScreenState(
      /* data: data, /*futureList: futureList*/*/
      );
}

class WADashboardScreenState extends State<WADashboardScreen> {
  // WADashboardScreenState({
  //   required this.data,
  //   //required this.futureList,
  // }) : assert(data != null);
  // final CreditCardModel data;

  int _selectedIndex = 0;
  late List<Widget> _pages = <Widget>[
    mainScreen(
        /*data: data,*/
        ),
    WAStatisticScreen(),
    WAWalletScreen(/*data: data*/),
    WAMyProfileScreen(/*data: data*/),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(6.0),
        // child: FloatingActionButton(

        //   backgroundColor: WAPrimaryColor,
        //   child: Icon(Icons.qr_code_scanner_sharp, color: Colors.white),
        //   onPressed: () {
        //     WAQrScannerScreen(
        //       /*data: data,*/
        //     ).launch(context);
        //   },
        // ),
        child: GestureDetector(
          
          onTap: (){
            WAQrScannerScreen(
             /*data: data,*/
           ).launch(context);
          },
          child: Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              //color: Colors.pink,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff05D0EB),
                    // Color(0xff6D22C7),
                    Color(0xff6D22C7),
                    Color(0xff6D22C7),
                    Color(0xff6D22C7),
                  ]),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(Icons.qr_code_scanner_sharp, color: Colors.white),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: SingleChildScrollView(
          child: BottomNavigationBar(
            backgroundColor: context.cardColor,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: WAPrimaryColor,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: 'Statistics'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.wallet), label: 'Wallet'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
