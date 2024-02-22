class CheckBalanceModel {
  String? responseCode;
  String? responseMessage;
  Receipt? receipt;
  ReceiptIcon? receiptIcon;

  CheckBalanceModel(
      {this.responseCode,
      this.responseMessage,
      this.receipt,
      this.receiptIcon});

  CheckBalanceModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
    receipt =
        json['receipt'] != null ? new Receipt.fromJson(json['receipt']) : null;
    receiptIcon = json['receiptIcon'] != null
        ? new ReceiptIcon.fromJson(json['receiptIcon'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    if (this.receipt != null) {
      data['receipt'] = this.receipt!.toJson();
    }
    if (this.receiptIcon != null) {
      data['receiptIcon'] = this.receiptIcon!.toJson();
    }
    return data;
  }
}

class Receipt {
  String? receiptNumber;
  String? traceNumber;
  String? tranDateTime;
  String? retrivalReferenceNumber;
  String? feeAmount;
  String? accountNumber;
  String? currencyCode;
  String? availableBalance;
  String? ledggerBalance;

  Receipt(
      {this.receiptNumber,
      this.traceNumber,
      this.tranDateTime,
      this.retrivalReferenceNumber,
      this.feeAmount,
      this.accountNumber,
      this.currencyCode,
      this.availableBalance,
      this.ledggerBalance});

  Receipt.fromJson(Map<String, dynamic> json) {
    receiptNumber = json['receiptNumber'];
    traceNumber = json['traceNumber'];
    tranDateTime = json['tranDateTime'];
    retrivalReferenceNumber = json['retrivalReferenceNumber'];
    feeAmount = json['feeAmount'];
    accountNumber = json['accountNumber'];
    currencyCode = json['currencyCode'];
    availableBalance = json['availableBalance'];
    ledggerBalance = json['ledggerBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['receiptNumber'] = this.receiptNumber;
    data['traceNumber'] = this.traceNumber;
    data['tranDateTime'] = this.tranDateTime;
    data['retrivalReferenceNumber'] = this.retrivalReferenceNumber;
    data['feeAmount'] = this.feeAmount;
    data['accountNumber'] = this.accountNumber;
    data['currencyCode'] = this.currencyCode;
    data['availableBalance'] = this.availableBalance;
    data['ledggerBalance'] = this.ledggerBalance;
    return data;
  }
}

class ReceiptIcon {
  List<String>? iconPath;

  ReceiptIcon({this.iconPath});

  ReceiptIcon.fromJson(Map<String, dynamic> json) {
    iconPath = json['iconPath'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iconPath'] = this.iconPath;
    return data;
  }
}