class CreditCardModel {
  String? responseCode;
  String? responseMessage;
  CardOrderInfo? cardOrderInfo;

  CreditCardModel(
      {this.responseCode, this.responseMessage, this.cardOrderInfo});

  CreditCardModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
    cardOrderInfo = json['cardOrderInfo'] != null
        ? new CardOrderInfo.fromJson(json['cardOrderInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    if (this.cardOrderInfo != null) {
      data['cardOrderInfo'] = this.cardOrderInfo!.toJson();
    }
    return data;
  }
}

class CardOrderInfo {
  PrimaryCardOrderInfo? primaryCardOrderInfo;
  List<SecondaryCardOrderInfo>? secondaryCardOrderInfo;

  CardOrderInfo({this.primaryCardOrderInfo, this.secondaryCardOrderInfo});

  CardOrderInfo.fromJson(Map<String, dynamic> json) {
    primaryCardOrderInfo = json['primaryCardOrderInfo'] != null
        ? new PrimaryCardOrderInfo.fromJson(json['primaryCardOrderInfo'])
        : null;
    if (json['secondaryCardOrderInfo'] != null) {
      secondaryCardOrderInfo = <SecondaryCardOrderInfo>[];
      json['secondaryCardOrderInfo'].forEach((v) {
        secondaryCardOrderInfo!.add(new SecondaryCardOrderInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.primaryCardOrderInfo != null) {
      data['primaryCardOrderInfo'] = this.primaryCardOrderInfo!.toJson();
    }
    if (this.secondaryCardOrderInfo != null) {
      data['secondaryCardOrderInfo'] =
          this.secondaryCardOrderInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrimaryCardOrderInfo {
  String? cardOrderId;
  String? oraderReceivedDate;
  String? cardReferenceNumber;
  String? instId;
  String? custId;
  String? productId;
  String? cardToken;
  String? card;
  String? addonCardStatus;
  String? addonCardCRN;
  String? currencyCodeId;
  String? panSeqNo;
  String? expiryDate;
  String? status;
  String? cvv2;
  Null? thresholdAmount;
  bool? domesticTrans;
  bool? internationalTrans;
  String? cardTemplateId;
  String? limitId;
  String? nameOnCard;

  PrimaryCardOrderInfo(
      {this.cardOrderId,
      this.oraderReceivedDate,
      this.cardReferenceNumber,
      this.instId,
      this.custId,
      this.productId,
      this.cardToken,
      this.card,
      this.addonCardStatus,
      this.addonCardCRN,
      this.currencyCodeId,
      this.panSeqNo,
      this.expiryDate,
      this.status,
      this.cvv2,
      this.thresholdAmount,
      this.domesticTrans,
      this.internationalTrans,
      this.cardTemplateId,
      this.limitId,
      this.nameOnCard});

  PrimaryCardOrderInfo.fromJson(Map<String, dynamic> json) {
    cardOrderId = json['cardOrderId'];
    oraderReceivedDate = json['oraderReceivedDate'];
    cardReferenceNumber = json['cardReferenceNumber'];
    instId = json['instId'];
    custId = json['custId'];
    productId = json['productId'];
    cardToken = json['cardToken'];
    card = json['card'];
    addonCardStatus = json['addonCardStatus'];
    addonCardCRN = json['addonCardCRN'];
    currencyCodeId = json['currencyCodeId'];
    panSeqNo = json['panSeqNo'];
    expiryDate = json['expiryDate'];
    status = json['status'];
    cvv2 = json['cvv2'];
    thresholdAmount = json['thresholdAmount'];
    domesticTrans = json['domesticTrans'];
    internationalTrans = json['internationalTrans'];
    cardTemplateId = json['cardTemplateId'];
    limitId = json['limitId'];
    nameOnCard = json['nameOnCard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardOrderId'] = this.cardOrderId;
    data['oraderReceivedDate'] = this.oraderReceivedDate;
    data['cardReferenceNumber'] = this.cardReferenceNumber;
    data['instId'] = this.instId;
    data['custId'] = this.custId;
    data['productId'] = this.productId;
    data['cardToken'] = this.cardToken;
    data['card'] = this.card;
    data['addonCardStatus'] = this.addonCardStatus;
    data['addonCardCRN'] = this.addonCardCRN;
    data['currencyCodeId'] = this.currencyCodeId;
    data['panSeqNo'] = this.panSeqNo;
    data['expiryDate'] = this.expiryDate;
    data['status'] = this.status;
    data['cvv2'] = this.cvv2;
    data['thresholdAmount'] = this.thresholdAmount;
    data['domesticTrans'] = this.domesticTrans;
    data['internationalTrans'] = this.internationalTrans;
    data['cardTemplateId'] = this.cardTemplateId;
    data['limitId'] = this.limitId;
    data['nameOnCard'] = this.nameOnCard;
    return data;
  }
}

class SecondaryCardOrderInfo {
  String? cardOrderId;
  String? oraderReceivedDate;
  String? cardReferenceNumber;
  String? instId;
  String? custId;
  String? productId;
  String? cardToken;
  String? card;
  String? addonCardStatus;
  Null? addonCardCRN;
  String? currencyCodeId;
  String? panSeqNo;
  String? expiryDate;
  String? status;
  String? cvv2;
  String? thresholdAmount;
  bool? domesticTrans;
  bool? internationalTrans;
  String? cardTemplateId;
  String? limitId;
  String? nameOnCard;

  SecondaryCardOrderInfo(
      {this.cardOrderId,
      this.oraderReceivedDate,
      this.cardReferenceNumber,
      this.instId,
      this.custId,
      this.productId,
      this.cardToken,
      this.card,
      this.addonCardStatus,
      this.addonCardCRN,
      this.currencyCodeId,
      this.panSeqNo,
      this.expiryDate,
      this.status,
      this.cvv2,
      this.thresholdAmount,
      this.domesticTrans,
      this.internationalTrans,
      this.cardTemplateId,
      this.limitId,
      this.nameOnCard});

  SecondaryCardOrderInfo.fromJson(Map<String, dynamic> json) {
    cardOrderId = json['cardOrderId'];
    oraderReceivedDate = json['oraderReceivedDate'];
    cardReferenceNumber = json['cardReferenceNumber'];
    instId = json['instId'];
    custId = json['custId'];
    productId = json['productId'];
    cardToken = json['cardToken'];
    card = json['card'];
    addonCardStatus = json['addonCardStatus'];
    addonCardCRN = json['addonCardCRN'];
    currencyCodeId = json['currencyCodeId'];
    panSeqNo = json['panSeqNo'];
    expiryDate = json['expiryDate'];
    status = json['status'];
    cvv2 = json['cvv2'];
    thresholdAmount = json['thresholdAmount'];
    domesticTrans = json['domesticTrans'];
    internationalTrans = json['internationalTrans'];
    cardTemplateId = json['cardTemplateId'];
    limitId = json['limitId'];
    nameOnCard = json['nameOnCard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardOrderId'] = this.cardOrderId;
    data['oraderReceivedDate'] = this.oraderReceivedDate;
    data['cardReferenceNumber'] = this.cardReferenceNumber;
    data['instId'] = this.instId;
    data['custId'] = this.custId;
    data['productId'] = this.productId;
    data['cardToken'] = this.cardToken;
    data['card'] = this.card;
    data['addonCardStatus'] = this.addonCardStatus;
    data['addonCardCRN'] = this.addonCardCRN;
    data['currencyCodeId'] = this.currencyCodeId;
    data['panSeqNo'] = this.panSeqNo;
    data['expiryDate'] = this.expiryDate;
    data['status'] = this.status;
    data['cvv2'] = this.cvv2;
    data['thresholdAmount'] = this.thresholdAmount;
    data['domesticTrans'] = this.domesticTrans;
    data['internationalTrans'] = this.internationalTrans;
    data['cardTemplateId'] = this.cardTemplateId;
    data['limitId'] = this.limitId;
    data['nameOnCard'] = this.nameOnCard;
    return data;
  }
}