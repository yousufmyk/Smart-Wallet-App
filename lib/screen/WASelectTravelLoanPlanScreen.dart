import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../main.dart';
import '../model/cardDetailsModel.dart';
import 'WAGlodPlanDailogScreen.dart';
import 'WAPlatinumPlanDailogScrenn.dart';
import 'WASilverPlanDailogScreen.dart';

class SelectTravelPlanScreen extends StatefulWidget {
  final CreditCardModel data;

  const SelectTravelPlanScreen({
    Key? key,
    required this.data,
    //required this.futureList,
  })  : assert(data != null),
        super(key: key);
  @override
  State<SelectTravelPlanScreen> createState() => _SelectTravelPlanScreenState(data : data);
}

class _SelectTravelPlanScreenState extends State<SelectTravelPlanScreen> {
  _SelectTravelPlanScreenState({
    required this.data,
    //required this.futureList,
  }) : assert(data != null);
  final CreditCardModel data;
  bool _hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            Text('Change Plan',
                style: boldTextStyle(color: Colors.black, size: 20)),
            Text(""
                //data.cardOrderInfo!.primaryCardOrderInfo!.card.toString(),
                ),
          ],
        ),
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
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              //1st Image of Slider

              //3rd Image of Slider
              SingleChildScrollView(
                child: Container(
                  height: 600,
                  width: 300,
                  //margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xffeeeeee)
                      // image: DecorationImage(
                      //   image: NetworkImage("https://media.istockphoto.com/id/973190966/photo/high-angle-view-of-people-on-street.jpg?s=612x612&w=0&k=20&c=GMVFJukOSVsOFX3HUQyBMm7VTndqjVcqrgs0X1PjW_Y="),
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        20.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Silver Plan',
                                  style: boldTextStyle(
                                      color: Color(0xff627790), size: 25))
                              .paddingLeft(16),
                        ),
                        7.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('AED 433.00',
                                  style: boldTextStyle(
                                      color: Color(0xff627790), size: 35))
                              .paddingLeft(16),
                        ),
                        15.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              'Our Basic travel insurance plan\n covering Schengen visa requirements.',
                              style: boldTextStyle(
                                  color: Color(0xffa6b1bd), size: 15)),
                        ),
                        50.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Key Coverages',
                                  style: boldTextStyle(
                                      color: Color(0xff627790), size: 16))
                              .paddingLeft(16),
                        ),
                        10.height,
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.check_circle_outline_outlined,
                              color: Color(0xff152b7c),
                            ),
                            5.width,
                            Text(
                              'Emergency Medical Expenses up \nto AED50,000',
                              style: secondaryTextStyle(
                                  color: Color(0xffa6b1bd), size: 15),
                            )
                          ],
                        ),
                        15.height,
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.check_circle_outline_outlined,
                              color: Color(0xff152b7c),
                            ),
                            5.width,
                            Text(
                              'COVID-19 Medical Expenses Covered',
                              style: secondaryTextStyle(
                                  color: Color(0xffa6b1bd), size: 15),
                            )
                          ],
                        ),
                        15.height,
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.check_circle_outline_outlined,
                              color: Color(0xff152b7c),
                            ),
                            5.width,
                            Text(
                              '24h worldwide assistance services',
                              style: secondaryTextStyle(
                                  color: Color(0xffa6b1bd), size: 15),
                            )
                          ],
                        ),
                        30.height,
                        Container(
                          width: 250,
                          child: Row(
                            children: [
                              Divider(thickness: 2).expand(),
                              Divider(thickness: 2).expand(),
                            ],
                          ),
                        ).center(),
                        30.height,
                        DialogButton(
                      // onPressed: () {
                      //   //  WADashboardScreen(
                      //   //     data: data,
                      //   //   ).launch(context);
                      // },
                      onPressed: () {
                        showInDialog(context, builder: (context) {
                          return SilverPlanSeletedDialog(
                            data: widget.data,
                          );
                        });
                      },
                      color: const Color.fromRGBO(0, 179, 134, 1.0),
                      child: const Text(
                        'Select This Plan',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                      ],
                    ),
                  ),
                ),
              ),

              //4th Image of Slider
              SingleChildScrollView(
                child: Container(
                  height: 600,
                  width: 300,
                  //margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xffeeeeee)
                      // image: DecorationImage(
                      //   image: NetworkImage("https://media.istockphoto.com/id/973190966/photo/high-angle-view-of-people-on-street.jpg?s=612x612&w=0&k=20&c=GMVFJukOSVsOFX3HUQyBMm7VTndqjVcqrgs0X1PjW_Y="),
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        20.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Gold Plan',
                                  style: boldTextStyle(
                                      color: Color(0xff627790), size: 25))
                              .paddingLeft(16),
                        ),
                        7.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('AED 678.00',
                                  style: boldTextStyle(
                                      color: Color(0xff627790), size: 35))
                              .paddingLeft(16),
                        ),
                        15.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              'Our most popular travel insurance plan covering Schengen visa requirements.',
                              style: boldTextStyle(
                                  color: Color(0xffa6b1bd), size: 15)),
                        ),
                        50.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Key Coverages',
                                  style: boldTextStyle(
                                      color: Color(0xff627790), size: 16))
                              .paddingLeft(16),
                        ),
                        10.height,
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.check_circle_outline_outlined,
                              color: Color(0xff152b7c),
                            ),
                            5.width,
                            Text(
                              'Emergency Medical Expenses up \n to AED100,000',
                              style: secondaryTextStyle(
                                  color: Color(0xffa6b1bd), size: 15),
                            )
                          ],
                        ),
                        15.height,
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.check_circle_outline_outlined,
                              color: Color(0xff152b7c),
                            ),
                            5.width,
                            Text(
                              'COVID-19 Medical Expenses Covered',
                              style: secondaryTextStyle(
                                  color: Color(0xffa6b1bd), size: 15),
                            )
                          ],
                        ),
                        15.height,
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.check_circle_outline_outlined,
                              color: Color(0xff152b7c),
                            ),
                            5.width,
                            Text(
                              'Baggage Loss or Damage up to\n AED1,000',
                              style: secondaryTextStyle(
                                  color: Color(0xffa6b1bd), size: 15),
                            )
                          ],
                        ),
                        30.height,
                        Container(
                          width: 250,
                          child: Row(
                            children: [
                              Divider(thickness: 2).expand(),
                              Divider(thickness: 2).expand(),
                            ],
                          ),
                        ).center(),
                        30.height,
                        DialogButton(
                          
                      // onPressed: () {
                      //   //  WADashboardScreen(
                      //   //     data: data,
                      //   //   ).launch(context);
                      // },
                      onPressed: () {
                        showInDialog(context, builder: (context) {
                          return GlodPlanSeletedDialog(
                            data: widget.data,
                          );
                        });
                      },
                      
                      color: const Color.fromRGBO(0, 179, 134, 1.0),
                      child: const Text(
                        'Select This Plan',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                      ],
                    ),
                  ),
                ),
              ),

              //5th Image of Slider
               SingleChildScrollView(
                child: Container(
                  height: 600,
                  width: 300,
                  //margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xffeeeeee)
                      // image: DecorationImage(
                      //   image: NetworkImage("https://media.istockphoto.com/id/973190966/photo/high-angle-view-of-people-on-street.jpg?s=612x612&w=0&k=20&c=GMVFJukOSVsOFX3HUQyBMm7VTndqjVcqrgs0X1PjW_Y="),
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        20.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Platinum Plan',
                                  style: boldTextStyle(
                                      color: Color(0xff627790), size: 25))
                              .paddingLeft(16),
                        ),
                        7.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('AED 947.00',
                                  style: boldTextStyle(
                                      color: Color(0xff627790), size: 35))
                              .paddingLeft(16),
                        ),
                        15.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              'Our most comprehensive travel insurance plan going above and beyond Schengen visa requirements.',
                              style: boldTextStyle(
                                  color: Color(0xffa6b1bd), size: 15)),
                        ),
                        50.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Key Coverages',
                                  style: boldTextStyle(
                                      color: Color(0xff627790), size: 16))
                              .paddingLeft(16),
                        ),
                        10.height,
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.check_circle_outline_outlined,
                              color: Color(0xff152b7c),
                            ),
                            5.width,
                            Text(
                              'Emergency Medical Expenses up \n to AED500,000',
                              style: secondaryTextStyle(
                                  color: Color(0xffa6b1bd), size: 15),
                            )
                          ],
                        ),
                        15.height,
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.check_circle_outline_outlined,
                              color: Color(0xff152b7c),
                            ),
                            5.width,
                            Text(
                              'COVID-19 Medical Expenses Covered \n up to AED250,000',
                              style: secondaryTextStyle(
                                  color: Color(0xffa6b1bd), size: 15),
                            )
                          ],
                        ),
                        15.height,
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.check_circle_outline_outlined,
                              color: Color(0xff152b7c),
                            ),
                            5.width,
                            Text(
                              'Baggage Loss or Damage up \n to AED2,500',
                              style: secondaryTextStyle(
                                  color: Color(0xffa6b1bd), size: 15),
                            )
                          ],
                        ),
                        30.height,
                        Container(
                          width: 250,
                          child: Row(
                            children: [
                              Divider(thickness: 2).expand(),
                              Divider(thickness: 2).expand(),
                            ],
                          ),
                        ).center(),
                        30.height,
                        DialogButton(
                      // onPressed: () {
                      //   //  WADashboardScreen(
                      //   //     data: data,
                      //   //   ).launch(context);
                      // },
                      onPressed: () {
                        showInDialog(context, builder: (context) {
                          return PlatinumPlanSeletedDialog(
                            data: widget.data,
                          );
                        });
                      },
                      color: const Color.fromRGBO(0, 179, 134, 1.0),
                      child: const Text(
                        'Select This Plan',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                      ],
                    ),
                  ),
                ),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              //height: 180.0
              //height: SizeConfig.screenHeight,
              enlargeCenterPage: true,
              autoPlay: false,
              aspectRatio: 9 / 16,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: false,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
