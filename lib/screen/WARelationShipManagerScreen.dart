import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social_share/social_share.dart';
import 'package:url_launcher/url_launcher.dart';



import '../main.dart';
import '../utils/WAWidgets.dart';

class RelationShipManagerScreen extends StatefulWidget {
  const RelationShipManagerScreen({Key? key}) : super(key: key);

  @override
  State<RelationShipManagerScreen> createState() =>
      _RelationShipManagerScreenState();
}

class _RelationShipManagerScreenState extends State<RelationShipManagerScreen> {
  final Uri _urlForOutLook = Uri.parse('https://outlook.office365.com/mail/');
  Future<void> _launchUrlOutLook() async {
  if (!await launchUrl(_urlForOutLook)) {
    throw Exception('Could not launch $_urlForOutLook');
  }
}

final Uri _urlForGmail = Uri.parse('https://mail.google.com/mail/');
  Future<void> _launchUrlGmail() async {
  if (!await launchUrl(_urlForGmail)) {
    throw Exception('Could not launch $_urlForOutLook');
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Relationship Manager',
          style: boldTextStyle(color: Colors.black, size: 20),
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
      body: SingleChildScrollView(
        child: Container(
          height: context.mediaQuerySize.height,
          width: context.mediaQuerySize.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/mobile_banking/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                //color: Color.fromARGB(255, 255, 254, 246),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    60.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Rashid",
                                  style: boldTextStyle(
                                      color: Colors.black, size: 20)),
                              Text("Relationship Manager",
                                  style: boldTextStyle()),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.greenAccent,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Online"),
                                      5.width,
                                      Text("UAE 🇦🇪")
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: CircleAvatar(
                            foregroundImage: AssetImage(
                                "images/mobile_banking/Screenshot 2023-03-09 171119.png"),
                            radius: 40,
                          ),
                        ),
                      ],
                    ),
                    30.height,
                    Text("Who i am?", style: boldTextStyle(size: 20)),
                    Text(
                        " Hi, This is Rashid. I'm a professional who aids in developing and maintaining strong customer relationships, both within a company as well as with outside clients.My Role is to seek out new business opportunities for Company and help our clients while advising them on products or services that best fit their needs.If You have any queries reach out to I'll love to help you out."),
                    15.height,
                    Text("My contact details:", style: boldTextStyle(size: 20)),
                    8.height,
                    Row(
                      children: [
                        Icon(Icons.call_rounded),
                        5.width,
                        Text("+971 50 7702149"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.email_outlined),
                        5.width,
                        Text("rashid@omaemirates.com"),
                      ],
                    ),
                    5.height,
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            SocialShare.shareWhatsapp(
                                          "Hi this is Yousuf I'm having problem in my transaction");
                          },
                            child: Image(
                                image: AssetImage(
                                    "images/mobile_banking/whatsapp2.png"))),
                        10.width,
                        GestureDetector(
                          onTap: () async{
                            await  _launchUrlOutLook();
                          },
                            child: Image(
                                image: AssetImage(
                                    "images/mobile_banking/outlook.png"))),
                        10.width,
                        GestureDetector(
                          onTap: ()async{
                           await _launchUrlGmail();
                          },
                            child: Image(
                                image: AssetImage(
                                    "images/mobile_banking/gmail (2).png"))),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ).paddingAll(30),
        ),
      ),
    );
  }
}
