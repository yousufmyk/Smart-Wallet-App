import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gif_view/gif_view.dart';
import 'package:nb_utils/nb_utils.dart';

import '../component/WAFingerprintComponent.dart';
import 'WADashboardScreen.dart';
import 'WALoginScreen.dart';
import 'WARegisterScreen.dart';
import 'WAWalkThroughScreen.dart';

class WAIntroScreen extends StatefulWidget {
  const WAIntroScreen({Key? key}) : super(key: key);

  @override
  State<WAIntroScreen> createState() => _WAIntroScreenState();
}

class _WAIntroScreenState extends State<WAIntroScreen> {
  bool isAuthenticated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:[
                Color(0xff05D0EB),
                // Color(0xff6D22C7),
                Color(0xff6D22C7),
                Color(0xff6D22C7),
                Color(0xff6D22C7),
      
              ])
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Image(image: AssetImage("images/mobile_banking/wa_app_logo.png"),height: 50,width:50,color: Colors.white,),
                SizedBox(
                  height: 120,
                  width: 150,
                  child: GifView.asset(
                    
                    "images/mobile_banking/animation_200_lis1aaso.gif",
                    //height: 300,
                    //width: 500,
                    frameRate: 30,
                    progress: Container(
                      height: 5,
                      width: 5,
                    )
                  ),
                ),
                16.height,
                Text('WELCOME TO',style: TextStyle(fontSize: 25,fontStyle: FontStyle.normal,color: Colors.white),),
                Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WALLET',
                                style: boldTextStyle(size: 27, color: Colors.white),),
                      Text(' APP',style: TextStyle(fontSize: 25,fontStyle: FontStyle.normal,color: Colors.white),)
                    ],
                  ),
                ),
                56.height,
                GestureDetector(
                  onTap: (){
                    //WAWalkThroughScreen().launch(context);
                    WALoginScreen(/*data: data,*/).launch(context);
                  },
                  child: Container(
                    height: 50,
                    //width: MediaQuery.of(context).size.width,
                    width: 240,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text('Log In',style: boldTextStyle(size: 17, color: Color(0xff6D22C7)),),
                    ),
                  ).paddingOnly(
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1),
                ),
                16.height,
                GestureDetector(
                  onTap: (){
                    WARegisterScreen().launch(context);
                  },
                  child: Container(
                    height: 50,
                    //width: MediaQuery.of(context).size.width,
                    width: 240,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text('Register',style: boldTextStyle(size: 17, color: Color(0xff6D22C7)),),
                    ),
                  ),
                ),
                16.height,
                Text('Or quick login',style: TextStyle(fontSize: 18,fontStyle: FontStyle.normal,color: Colors.white),),
                Text('with Touch ID',style: TextStyle(fontSize: 18,fontStyle: FontStyle.normal,color: Colors.white),),
                8.height,
                IconButton(onPressed: () async{
                  isAuthenticated = await FingerPrintComponent().authenticate();
                   if(isAuthenticated == true) {
                  return  WADashboardScreen(
                  /*data: CreditCardModel.fromJson(jsonDecode(response.body))*/)
              .launch(context);
                  
                  }
                  else {
                    print("Error");
                  }
                }, icon: Icon(Icons.fingerprint_rounded,color: Colors.white70,size: 60,))
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}