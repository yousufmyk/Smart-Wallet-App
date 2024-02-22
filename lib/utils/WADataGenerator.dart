import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:http/http.dart' as http;
import 'package:wallet_app/model/WalletAppModel.dart';
import 'package:wallet_app/screen/WABillPayScreen.dart';
import 'package:wallet_app/screen/WACreditCardScreen.dart';
import 'package:wallet_app/screen/WASendMoneyViaLoopScreen.dart';
import 'package:wallet_app/screen/WAVoucherScreen.dart';

import '../model/cardDetailsModel.dart';
import '../screen/WARewardsScreen.dart';

class Testing extends StatefulWidget {
  final CreditCardModel data;

  const Testing({
    Key? key,
    required this.data,
    //required this.futureList,
  })  : assert(data != null),
        super(key: key);

  @override
  State<Testing> createState() => _TestingState(data: data);
}

class _TestingState extends State<Testing> {
  _TestingState({
    required this.data,
    //required this.futureList,
  }) : assert(data != null);
  final CreditCardModel data;

  List<WAOperationsModel> waOperationList() {
    List<WAOperationsModel> operationModel = [];
    operationModel.add(WAOperationsModel(
      color: Color(0xFF6C56F9),
      title: 'Transfer',
      image: 'images/mobile_banking/wa_transfer.png',
      widget: WASendMoneyViaLoopScreen(/*data: data*/),
    ));
    operationModel.add(WAOperationsModel(
      color: Color(0xFFFF7426),
      title: 'Vouchers',
      image: 'images/mobile_banking/wa_voucher.png',
      widget: WAVoucherScreen(/*data: data,*/),
    ));
    operationModel.add(WAOperationsModel(
      color: Color(0xFF6C56F9),
      title: 'Top Up',
      image: 'images/mobile_banking/wa_ticket.png',
      widget: WACreditCardScreen(
        /*data: data,*/
      ),
    ));
    operationModel.add(WAOperationsModel(
      color: Color(0xFF26C884),
      title: 'Bill Pay',
      image: 'images/mobile_banking/wa_bill_pay.png',
      widget: WABillPayScreen(
       /* data: data,*/
      ),
    ));
    operationModel.add(WAOperationsModel(
      color: Color(0xFF6C56F9),
      title: 'Rewards',
      image: 'images/mobile_banking/wa_ticket.png',
      widget: WARewardScreen(
        data: data,
      ),
    ));
    operationModel.add(WAOperationsModel(
      color: Color(0xFF26C884),
      title: 'Shopping',
      image: 'images/mobile_banking/wa_bill_pay.png',
    ));
    operationModel.add(WAOperationsModel(
      color: Color(0xFFFF7426),
      title: 'Tickets',
      image: 'images/mobile_banking/wa_voucher.png',
    ));
    operationModel.add(WAOperationsModel(
      color: Color(0xFF6C56F9),
      title: 'Budgets',
      image: 'images/mobile_banking/wa_voucher.png',
    ));
    operationModel.add(WAOperationsModel(
      color: Color(0xFFFF7426),
      title: 'Request',
      image: 'images/mobile_banking/wa_transfer.png',
    ));
    return operationModel;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

List<String?> waMonthList = <String?>[
  "Jan",
  "Feb",
  "Mar",
  "April",
  "May",
  "June",
  "July",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];
List<String?> waYearList = <String?>[
  "1991",
  "1992",
  "1993",
  "1994",
  "1995",
  "1996",
  "1997",
  "1998",
  "1999",
  "2020",
  "2021"
];
List<String?> waOrgList = <String?>[
  "All",
  "Water",
  "Gas",
  "Electricity",
  "Internet",
  "Education",
  "Landline"
];
List<String?> amountList = ["500", "800", "1000"];
List<String?> overViewList = ["All", "Weekly", "Yearly", "Daily", "Monthly"];

List<WAWalkThroughModel> waWalkThroughList() {
  List<WAWalkThroughModel> list = [];
  list.add(WAWalkThroughModel(
      title: "Easily Accessible",
      description:
          "Simplify your financial life with our user-friendly and easily accessible wallet app.",
      image: 'images/mobile_banking/wa_walkthorugh.png'));
  list.add(WAWalkThroughModel(
      title: "Manage Anytime",
      description:
          "Manage Anytime: Empowering Efficiency and Success at Your Fingertips!",
      image: "images/mobile_banking/21890-removebg-preview.png"));
  list.add(WAWalkThroughModel(
      title: "Safe Transaction",
      description:
          "Safe Transaction: Ensuring Security and Peace of Mind for Your Financial Transactions!",
      image: "images/mobile_banking/Screenshot_2023-06-10_185428-removebg-preview.png"));

  return list;
}

List<WACardModel> waCardList() {
  List<WACardModel> cardList = [];

  cardList.add(WACardModel(
      balance: '\$12,00,000',
      cardNumber: '123 985 7654327',
      date: '03/23',
      color: Color(0xFF6C56F9)));
  // cardList.add(WACardModel(
  //     balance: '\$12,23,000',
  //     cardNumber: '985 123 7654327',
  //     date: '25/23',
  //     color: Color(0xFFFF7426)));
  // cardList.add(WACardModel(
  //     balance: '\$23,00,000',
  //     cardNumber: '765 123 9854327',
  //     date: '03/25',
  //     color: Color(0xFF26C884)));
  return cardList;
}

List<WACardModel2> waCardList2() {
  List<WACardModel2> cardList2 = [];
  cardList2.add(WACardModel2(
      balance: '\$12,00,000',
      cardNumber: '123 985 7654327',
      date: '03/23',
      color: Color(0xFF6C56F9)));
  // cardList.add(WACardModel(
  //     balance: '\$12,23,000',
  //     cardNumber: '985 123 7654327',
  //     date: '25/23',
  //     color: Color(0xFFFF7426)));
  // cardList.add(WACardModel(
  //     balance: '\$23,00,000',
  //     cardNumber: '765 123 9854327',
  //     date: '03/25',
  //     color: Color(0xFF26C884)));
  return cardList2;
}

List<WATransactionModel> waTransactionList() {
  List<WATransactionModel> transactionList = [];
  transactionList.add(WATransactionModel(
    color: Color(0xFFFF7426),
    title: 'Send Money to',
    image: 'images/mobile_banking/wa_bill_pay.png',
    balance: '-\$20,000',
    name: 'James',
    time: 'Today 5:30 PM',
  ));
  transactionList.add(WATransactionModel(
    color: Color(0xFF26C884),
    title: 'Salary from',
    image: 'images/mobile_banking/wa_voucher.png',
    balance: '+\$50,000',
    name: 'Unbox Digital',
    time: 'Today 6:30 PM',
  ));
  return transactionList;
}

List<WARecentPayeesModel> waRecentPayeesList() {
  List<WARecentPayeesModel> list = [];
  list.add(WARecentPayeesModel(
      image:
          'https://th.bing.com/th/id/OIG.zkpBEO0HK7kb.Qf5phAN?w=173&h=173&c=6&r=0&o=5&pid=ImgGn',
      name: 'Yousuf',
      number: '05012459'));
  list.add(WARecentPayeesModel(
      image:
          'https://th.bing.com/th/id/OIG.9rStB9zQK5ekxyRJFWUW?w=173&h=173&c=6&r=0&o=5&pid=ImgGn',
      name: 'Ahmed',
      number: '05012456'));
  list.add(WARecentPayeesModel(
      image:
          'https://th.bing.com/th/id/OIG.fIHpNsGMn4Wi4PRe8_AH?w=173&h=173&c=6&r=0&o=5&pid=ImgGn',
      name: 'Rashid',
      number: '05012456'));
  list.add(WARecentPayeesModel(
      image:
          'https://th.bing.com/th/id/OIG.qQ1Lqu.qZFVUGPnbWVtM?w=173&h=173&c=6&r=0&o=5&pid=ImgGn',
      name: 'Alex',
      number: '05012456'));
  list.add(WARecentPayeesModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5yt4pfdz3-lacajgUY5xuRuciElEaMZa9luc29Vgx2oVLDQceaFmxgcUXRzU-IfTZcWA&usqp=CAU',
      name: 'Ramm',
      number: '852123522'));
  list.add(WARecentPayeesModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIuNPlLLXKdjlBivtZzQxsq-hW9E6YbooFXqDqST7AfuSHGcN45DIDTi5qeLOQHNrNR9g&usqp=CAU',
      name: 'Rose',
      number: '852123522'));
  list.add(WARecentPayeesModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw9jzCKDNeX4QbAQOAABXMML3djP3ZVEv1-rpbKgfyNCshsC-zhB3Ta2JXdMxvvSOFszg&usqp=CAU',
      name: 'Bella',
      number: '852123522'));
  return list;
}
List<WABillPayModel> waBillPayList() {
  List<WABillPayModel> list = [];
  list.add(WABillPayModel(
      title: 'Water',
      color: Colors.blue,
      image: 'images/mobile_banking/wa_water.png'));
  list.add(WABillPayModel(
      title: 'Gas',
      color: Color(0xFFFF7426),
      image: 'images/mobile_banking/wa_gas.png'));
  list.add(WABillPayModel(
      title: 'Electricity',
      color: Colors.yellow,
      image: 'images/mobile_banking/wa_electricity.png'));
  list.add(WABillPayModel(
      title: 'Internet',
      color: Colors.pink,
      image: 'images/mobile_banking/wa_internet.png'));
  list.add(WABillPayModel(
      title: 'Education',
      color: Colors.green,
      image: 'images/mobile_banking/wa_education.png'));
  list.add(WABillPayModel(
      title: 'Landline',
      color: Colors.lightBlueAccent,
      image: 'images/mobile_banking/wa_landline.png'));

  return list;
}

List<WAOrganizationModel> waOrganizationList() {
  List<WAOrganizationModel> list = [];
  list.add(WAOrganizationModel(
      color: Colors.blue,
      image: 'images/mobile_banking/wa_water.png',
      title: 'Water',
      subTitle: 'SEWA'));
  list.add(WAOrganizationModel(
      color: Colors.yellow,
      image: 'images/mobile_banking/wa_electricity.png',
      title: 'DEWA',
      subTitle: 'Electricity '));
  list.add(WAOrganizationModel(
      color: Colors.pink,
      image: 'images/mobile_banking/wa_internet.png',
      title: 'Etisalat',
      subTitle: 'Internet '));
  list.add(WAOrganizationModel(
      color: Colors.yellow,
      image: 'images/mobile_banking/wa_electricity.png',
      title: 'FEWA ',
      subTitle: 'Electricity '));
  list.add(WAOrganizationModel(
      color: Colors.pink,
      image: 'images/mobile_banking/wa_internet.png',
      title: 'DU',
      subTitle: 'Internet '));
  list.add(WAOrganizationModel(
      color: Colors.redAccent,
      title: "Netflix",
      image:
          'images/mobile_banking/Screenshot_2023-02-28_145409-removebg-preview.png',
      subTitle: "Netflix"));
  list.add(WAOrganizationModel(
      color: Colors.black,
      title: "Disney",
      image:
          "images/mobile_banking/Screenshot_2023-02-28_153549-removebg-preview (1).png",
      subTitle: "Disney"));
  list.add(WAOrganizationModel(
      color: Colors.blueAccent,
      title: "Amazon",
      image:
          "images/mobile_banking/Screenshot_2023-02-28_153859-removebg-preview (1).png",
      subTitle: "Amazon"));
  return list;
}

List<WABillPayModel> waSelectBillList() {
  List<WABillPayModel> list = [];
  list.add(WABillPayModel(
      title: 'CityBank',
      image: 'images/mobile_banking/wa_city_bank_image.png'));
  list.add(WABillPayModel(
      title: 'Bank of America',
      image: 'images/mobile_banking/wa_bank_of_america.png'));
  list.add(WABillPayModel(
      title: 'Yes Bank', image: 'images/mobile_banking/wa_yes_bank.png'));
  return list;
}

List<WACardModel> waSendViaCardList() {
  List<WACardModel> list = [];
  list.add(WACardModel(
      name: "Yousuf",
      balance: '\$12,00,000',
      cardNumber: '123 985 7654327',
      date: '03/23',
      color: Color(0xFF6C56F9),
      image: 'images/mobile_banking/wa_card.png'));
  list.add(WACardModel(
      name: "Sardar",
      balance: '\$12,23,000',
      cardNumber: '985 123 7654327',
      date: '25/23',
      color: Color(0xFFFF7426),
      image: 'images/mobile_banking/wa_card.png'));
  list.add(WACardModel(
      balance: '\$23,00,000',
      cardNumber: '765 123 9854327',
      date: '03/25',
      color: Color(0xFF26C884),
      image: 'images/mobile_banking/wa_card.png'));
  return list;
}

List<WACardModel2> waSendViaCardList2() {
  List<WACardModel2> list = [];
  list.add(WACardModel2(
      balance: '\$12,00,000',
      cardNumber: '123 985 7654327',
      date: '03/23',
      color: Color(0xFF6C56F9),
      image: 'images/mobile_banking/wa_card.png'));
  list.add(WACardModel2(
      balance: '\$12,23,000',
      cardNumber: '985 123 7654327',
      date: '25/23',
      color: Color(0xFFFF7426),
      image: 'images/mobile_banking/wa_card.png'));
  list.add(WACardModel2(
      balance: '\$23,00,000',
      cardNumber: '765 123 9854327',
      date: '03/25',
      color: Color(0xFF26C884),
      image: 'images/mobile_banking/wa_card.png'));
  return list;
}

List<WAWalletUserModel> waWalletUserList() {
  List<WAWalletUserModel> list = [];
  list.add(WAWalletUserModel(
      image:
          "https://www.vrsiddhartha.ac.in/me/wp-content/uploads/learn-press-profile/4/172522ec1028ab781d9dfd17eaca4427.jpg"));
  list.add(WAWalletUserModel(
      image:
          "https://royalrajtravels.com/image/1613583503main-qimg-6291c3a117fc230c82785148baef7eed.jpg"));
  list.add(WAWalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5yt4pfdz3-lacajgUY5xuRuciElEaMZa9luc29Vgx2oVLDQceaFmxgcUXRzU-IfTZcWA&usqp=CAU"));
  list.add(WAWalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXs_iIewEiaZ3tXb6n6VgaUIONS0B0HjwsqcvA3-EnnaNm0BwX216u2dZl2QTHnP7VOIU&usqp=CAU"));
  list.add(WAWalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  list.add(WAWalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  list.add(WAWalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  list.add(WAWalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  list.add(WAWalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  list.add(WAWalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  return list;
}

List<WATransactionModel> waCategoriesList() {
  List<WATransactionModel> list = [];
  list.add(WATransactionModel(
      color: Color(0xFF26C884),
      title: 'Clothes',
      image: 'images/mobile_banking/wa_clothes.png',
      balance: "د.إ1500",
      time: 'Today 12:30 PM'));
  list.add(WATransactionModel(
      color: Color(0xFFFF7426),
      title: 'Grocery',
      image: 'images/mobile_banking/wa_food.png',
      balance: "د.إ5120",
      time: 'Today 1:02 PM'));
  return list;
}

List<WAVoucherModel> waVouchersList() {
  List<WAVoucherModel> list = [];
  list.add(WAVoucherModel(
      image: 'images/mobile_banking/Screenshot 2023-02-04 113746.png',
      title: 'MAX',
      discountText: '10% Off',
      expireTime: 'Expires on 15 June',
      pointsText: 'For 1500 points'));
  list.add(WAVoucherModel(
      image: 'images/mobile_banking/wa_macdonals.jpeg',
      title: 'Mcdonald\'s',
      discountText: '5% Off',
      expireTime: 'Expires on 20 June',
      pointsText: 'For 600 points'));
  list.add(WAVoucherModel(
      image: 'images/mobile_banking/albaik.png',
      title: 'Al baik',
      discountText: '5% Off',
      expireTime: 'Expires on 20 June',
      pointsText: 'For 600 points'));
  list.add(WAVoucherModel(
      image: 'images/mobile_banking/Screenshot 2023-02-04 114353.png',
      title: 'KFC',
      discountText: '10% Off',
      expireTime: 'Expires on 15 June',
      pointsText: 'For 1500 points'));
  list.add(WAVoucherModel(
      image: 'images/mobile_banking/Screenshot 2023-02-04 114552.png',
      title: 'LV',
      discountText: '10% Off',
      expireTime: 'Expires on 15 June',
      pointsText: 'For 1500 points'));
  list.add(WAVoucherModel(
      image: 'images/mobile_banking/Screenshot 2023-02-04 114735.png',
      title: 'American Eagle ',
      discountText: '5% Off',
      expireTime: 'Expires on 20 June',
      pointsText: 'For 600 points'));
  list.add(WAVoucherModel(
      image: 'images/mobile_banking/Screenshot 2023-02-04 114937.png',
      title: 'MAF carrefour',
      discountText: '5% Off',
      expireTime: 'Expires on 20 June',
      pointsText: 'For 600 points'));
  list.add(WAVoucherModel(
      image: 'images/mobile_banking/Screenshot 2023-02-04 115211.png',
      title: 'City Center',
      discountText: '10% Off',
      expireTime: 'Expires on 15 June',
      pointsText: 'For 1500 points'));
  return list;
}

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(
        id: 1,
        name: 'English',
        languageCode: 'en',
        fullLanguageCode: 'en-US',
        flag: 'images/flag/ic_us.png'),
    LanguageDataModel(
        id: 2,
        name: 'Hindi',
        languageCode: 'hi',
        fullLanguageCode: 'hi-IN',
        flag: 'images/flag/ic_hi.png'),
    LanguageDataModel(
        id: 3,
        name: 'Arabic',
        languageCode: 'ar',
        fullLanguageCode: 'ar-AR',
        flag: 'images/flag/ic_ar.png'),
    LanguageDataModel(
        id: 4,
        name: 'French',
        languageCode: 'fr',
        fullLanguageCode: 'fr-FR',
        flag: 'images/flag/ic_fr.png'),
  ];
}
