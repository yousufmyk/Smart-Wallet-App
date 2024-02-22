class CardLimitsModel {
  String? responseCode;
  String? responseMessage;
  CardLimitInfo? cardLimitInfo;

  CardLimitsModel(
      {this.responseCode, this.responseMessage, this.cardLimitInfo});

  CardLimitsModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
    cardLimitInfo = json['cardLimitInfo'] != null
        ? new CardLimitInfo.fromJson(json['cardLimitInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    if (this.cardLimitInfo != null) {
      data['cardLimitInfo'] = this.cardLimitInfo!.toJson();
    }
    return data;
  }
}

class CardLimitInfo {
  PrimaryLimitInfo? primaryLimitInfo;
  List<SecondaryCardLimitInfo>? secondaryCardLimitInfo;

  CardLimitInfo({this.primaryLimitInfo, this.secondaryCardLimitInfo});

  CardLimitInfo.fromJson(Map<String, dynamic> json) {
    primaryLimitInfo = json['primaryLimitInfo'] != null
        ? new PrimaryLimitInfo.fromJson(json['primaryLimitInfo'])
        : null;
    if (json['secondaryCardLimitInfo'] != null) {
      secondaryCardLimitInfo = <SecondaryCardLimitInfo>[];
      json['secondaryCardLimitInfo'].forEach((v) {
        secondaryCardLimitInfo!.add(new SecondaryCardLimitInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.primaryLimitInfo != null) {
      data['primaryLimitInfo'] = this.primaryLimitInfo!.toJson();
    }
    if (this.secondaryCardLimitInfo != null) {
      data['secondaryCardLimitInfo'] =
          this.secondaryCardLimitInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrimaryLimitInfo {
  String? instId;
  String? custId;
  String? productId;
  String? cardReferenceNumber;
  String? cardToken;
  String? card;
  String? addonCardStatus;
  String? addonCardCRN;
  String? status;
  String? thresholdAmount;
  bool? domesticTrans;
  bool? internationalTrans;
  Atm? atm;
  Atm? pos;
  Atm? ecom;
  Atm? nw;

  PrimaryLimitInfo(
      {this.instId,
      this.custId,
      this.productId,
      this.cardReferenceNumber,
      this.cardToken,
      this.card,
      this.addonCardStatus,
      this.addonCardCRN,
      this.status,
      this.thresholdAmount,
      this.domesticTrans,
      this.internationalTrans,
      this.atm,
      this.pos,
      this.ecom,
      this.nw});

  PrimaryLimitInfo.fromJson(Map<String, dynamic> json) {
    instId = json['instId'];
    custId = json['custId'];
    productId = json['productId'];
    cardReferenceNumber = json['cardReferenceNumber'];
    cardToken = json['cardToken'];
    card = json['card'];
    addonCardStatus = json['addonCardStatus'];
    addonCardCRN = json['addonCardCRN'];
    status = json['status'];
    thresholdAmount = json['thresholdAmount'];
    domesticTrans = json['domesticTrans'];
    internationalTrans = json['internationalTrans'];
    atm = json['atm'] != null ? new Atm.fromJson(json['atm']) : null;
    pos = json['pos'] != null ? new Atm.fromJson(json['pos']) : null;
    ecom = json['ecom'] != null ? new Atm.fromJson(json['ecom']) : null;
    nw = json['nw'] != null ? new Atm.fromJson(json['nw']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['instId'] = this.instId;
    data['custId'] = this.custId;
    data['productId'] = this.productId;
    data['cardReferenceNumber'] = this.cardReferenceNumber;
    data['cardToken'] = this.cardToken;
    data['card'] = this.card;
    data['addonCardStatus'] = this.addonCardStatus;
    data['addonCardCRN'] = this.addonCardCRN;
    data['status'] = this.status;
    data['thresholdAmount'] = this.thresholdAmount;
    data['domesticTrans'] = this.domesticTrans;
    data['internationalTrans'] = this.internationalTrans;
    if (this.atm != null) {
      data['atm'] = this.atm!.toJson();
    }
    if (this.pos != null) {
      data['pos'] = this.pos!.toJson();
    }
    if (this.ecom != null) {
      data['ecom'] = this.ecom!.toJson();
    }
    if (this.nw != null) {
      data['nw'] = this.nw!.toJson();
    }
    return data;
  }
}

class Atm {
  String? minAmount;
  String? maxAmount;
  String? status;
  String? domesticDailyAmount;
  int? domesticDailyCount;
  String? domesticWeeklyAmount;
  int? domesticWeeklyCount;
  String? domesticMonthlyAmount;
  int? domesticMonthlyCount;
  String? domesticYearlyAmount;
  int? domesticYearlyCount;
  String? internationalDailyAmount;
  int? internationalDailyCount;
  String? internationalWeeklyAmount;
  int? internationalWeeklyCount;
  String? internationalMonthlyAmount;
  int? internationalMonthlyCount;
  String? internationalYearlyAmount;
  int? internationalYearlyCount;

  Atm(
      {this.minAmount,
      this.maxAmount,
      this.status,
      this.domesticDailyAmount,
      this.domesticDailyCount,
      this.domesticWeeklyAmount,
      this.domesticWeeklyCount,
      this.domesticMonthlyAmount,
      this.domesticMonthlyCount,
      this.domesticYearlyAmount,
      this.domesticYearlyCount,
      this.internationalDailyAmount,
      this.internationalDailyCount,
      this.internationalWeeklyAmount,
      this.internationalWeeklyCount,
      this.internationalMonthlyAmount,
      this.internationalMonthlyCount,
      this.internationalYearlyAmount,
      this.internationalYearlyCount});

  Atm.fromJson(Map<String, dynamic> json) {
    minAmount = json['minAmount'];
    maxAmount = json['maxAmount'];
    status = json['status'];
    domesticDailyAmount = json['domesticDailyAmount'];
    domesticDailyCount = json['domesticDailyCount'];
    domesticWeeklyAmount = json['domesticWeeklyAmount'];
    domesticWeeklyCount = json['domesticWeeklyCount'];
    domesticMonthlyAmount = json['domesticMonthlyAmount'];
    domesticMonthlyCount = json['domesticMonthlyCount'];
    domesticYearlyAmount = json['domesticYearlyAmount'];
    domesticYearlyCount = json['domesticYearlyCount'];
    internationalDailyAmount = json['internationalDailyAmount'];
    internationalDailyCount = json['internationalDailyCount'];
    internationalWeeklyAmount = json['internationalWeeklyAmount'];
    internationalWeeklyCount = json['internationalWeeklyCount'];
    internationalMonthlyAmount = json['internationalMonthlyAmount'];
    internationalMonthlyCount = json['internationalMonthlyCount'];
    internationalYearlyAmount = json['internationalYearlyAmount'];
    internationalYearlyCount = json['internationalYearlyCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minAmount'] = this.minAmount;
    data['maxAmount'] = this.maxAmount;
    data['status'] = this.status;
    data['domesticDailyAmount'] = this.domesticDailyAmount;
    data['domesticDailyCount'] = this.domesticDailyCount;
    data['domesticWeeklyAmount'] = this.domesticWeeklyAmount;
    data['domesticWeeklyCount'] = this.domesticWeeklyCount;
    data['domesticMonthlyAmount'] = this.domesticMonthlyAmount;
    data['domesticMonthlyCount'] = this.domesticMonthlyCount;
    data['domesticYearlyAmount'] = this.domesticYearlyAmount;
    data['domesticYearlyCount'] = this.domesticYearlyCount;
    data['internationalDailyAmount'] = this.internationalDailyAmount;
    data['internationalDailyCount'] = this.internationalDailyCount;
    data['internationalWeeklyAmount'] = this.internationalWeeklyAmount;
    data['internationalWeeklyCount'] = this.internationalWeeklyCount;
    data['internationalMonthlyAmount'] = this.internationalMonthlyAmount;
    data['internationalMonthlyCount'] = this.internationalMonthlyCount;
    data['internationalYearlyAmount'] = this.internationalYearlyAmount;
    data['internationalYearlyCount'] = this.internationalYearlyCount;
    return data;
  }
}

class SecondaryCardLimitInfo {
  String? instId;
  String? custId;
  String? productId;
  String? cardReferenceNumber;
  String? cardToken;
  String? card;
  String? addonCardStatus;
  Null? addonCardCRN;
  String? status;
  String? thresholdAmount;
  bool? domesticTrans;
  bool? internationalTrans;
  Atm? atm;
  Atm? pos;
  Atm? ecom;
  Atm? nw;

  SecondaryCardLimitInfo(
      {this.instId,
      this.custId,
      this.productId,
      this.cardReferenceNumber,
      this.cardToken,
      this.card,
      this.addonCardStatus,
      this.addonCardCRN,
      this.status,
      this.thresholdAmount,
      this.domesticTrans,
      this.internationalTrans,
      this.atm,
      this.pos,
      this.ecom,
      this.nw});

  SecondaryCardLimitInfo.fromJson(Map<String, dynamic> json) {
    instId = json['instId'];
    custId = json['custId'];
    productId = json['productId'];
    cardReferenceNumber = json['cardReferenceNumber'];
    cardToken = json['cardToken'];
    card = json['card'];
    addonCardStatus = json['addonCardStatus'];
    addonCardCRN = json['addonCardCRN'];
    status = json['status'];
    thresholdAmount = json['thresholdAmount'];
    domesticTrans = json['domesticTrans'];
    internationalTrans = json['internationalTrans'];
    atm = json['atm'] != null ? new Atm.fromJson(json['atm']) : null;
    pos = json['pos'] != null ? new Atm.fromJson(json['pos']) : null;
    ecom = json['ecom'] != null ? new Atm.fromJson(json['ecom']) : null;
    nw = json['nw'] != null ? new Atm.fromJson(json['nw']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['instId'] = this.instId;
    data['custId'] = this.custId;
    data['productId'] = this.productId;
    data['cardReferenceNumber'] = this.cardReferenceNumber;
    data['cardToken'] = this.cardToken;
    data['card'] = this.card;
    data['addonCardStatus'] = this.addonCardStatus;
    data['addonCardCRN'] = this.addonCardCRN;
    data['status'] = this.status;
    data['thresholdAmount'] = this.thresholdAmount;
    data['domesticTrans'] = this.domesticTrans;
    data['internationalTrans'] = this.internationalTrans;
    if (this.atm != null) {
      data['atm'] = this.atm!.toJson();
    }
    if (this.pos != null) {
      data['pos'] = this.pos!.toJson();
    }
    if (this.ecom != null) {
      data['ecom'] = this.ecom!.toJson();
    }
    if (this.nw != null) {
      data['nw'] = this.nw!.toJson();
    }
    return data;
  }
}