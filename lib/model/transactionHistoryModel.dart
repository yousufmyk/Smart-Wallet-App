class StatementModel {
  List<Content>? content;

  StatementModel({this.content});

  StatementModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String? processFlag;
  String? traceNumber;
  String? cardReferenceNumber;
  String? instId;
  String? custId;
  String? currencyCodeId;
  String? accountNumber;
  String? walletId;
  String? amount;
  String? feeAmount;
  String? tranDateTime;
  String? tranDate;
  String? responseCode;
  String? tranType;
  String? retrivalReferenceNumber;
  String? tranDescription;
  String? authCode;
  String? receiptNumber;
  bool? internationalTrans;
  String? channelType;
  String? srcAccountNumber;
  String? srcCard;
  String? lastAccess;
  String? card;
  String? productId;

  Content(
      {this.processFlag,
      this.traceNumber,
      this.cardReferenceNumber,
      this.instId,
      this.custId,
      this.currencyCodeId,
      this.accountNumber,
      this.walletId,
      this.amount,
      this.feeAmount,
      this.tranDateTime,
      this.tranDate,
      this.responseCode,
      this.tranType,
      this.retrivalReferenceNumber,
      this.tranDescription,
      this.authCode,
      this.receiptNumber,
      this.internationalTrans,
      this.channelType,
      this.srcAccountNumber,
      this.srcCard,
      this.lastAccess,
      this.card,
      this.productId});

  Content.fromJson(Map<String, dynamic> json) {
    processFlag = json['processFlag'];
    traceNumber = json['traceNumber'];
    cardReferenceNumber = json['cardReferenceNumber'];
    instId = json['instId'];
    custId = json['custId'];
    currencyCodeId = json['currencyCodeId'];
    accountNumber = json['accountNumber'];
    walletId = json['walletId'];
    amount = json['amount'];
    feeAmount = json['feeAmount'];
    tranDateTime = json['tranDateTime'];
    tranDate = json['tranDate'];
    responseCode = json['responseCode'];
    tranType = json['tranType'];
    retrivalReferenceNumber = json['retrivalReferenceNumber'];
    tranDescription = json['tranDescription'];
    authCode = json['authCode'];
    receiptNumber = json['receiptNumber'];
    internationalTrans = json['internationalTrans'];
    channelType = json['channelType'];
    srcAccountNumber = json['srcAccountNumber'];
    srcCard = json['srcCard'];
    lastAccess = json['lastAccess'];
    card = json['card'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['processFlag'] = this.processFlag;
    data['traceNumber'] = this.traceNumber;
    data['cardReferenceNumber'] = this.cardReferenceNumber;
    data['instId'] = this.instId;
    data['custId'] = this.custId;
    data['currencyCodeId'] = this.currencyCodeId;
    data['accountNumber'] = this.accountNumber;
    data['walletId'] = this.walletId;
    data['amount'] = this.amount;
    data['feeAmount'] = this.feeAmount;
    data['tranDateTime'] = this.tranDateTime;
    data['tranDate'] = this.tranDate;
    data['responseCode'] = this.responseCode;
    data['tranType'] = this.tranType;
    data['retrivalReferenceNumber'] = this.retrivalReferenceNumber;
    data['tranDescription'] = this.tranDescription;
    data['authCode'] = this.authCode;
    data['receiptNumber'] = this.receiptNumber;
    data['internationalTrans'] = this.internationalTrans;
    data['channelType'] = this.channelType;
    data['srcAccountNumber'] = this.srcAccountNumber;
    data['srcCard'] = this.srcCard;
    data['lastAccess'] = this.lastAccess;
    data['card'] = this.card;
    data['productId'] = this.productId;
    return data;
  }
}
