class Pdfmodel {
  List<Content>? content;
  Pageable? pageable;
  int? totalPages;
  int? totalElements;
  bool? last;
  int? size;
  int? number;
  Sort? sort;
  int? numberOfElements;
  bool? first;
  bool? empty;

  Pdfmodel(
      {this.content,
      this.pageable,
      this.totalPages,
      this.totalElements,
      this.last,
      this.size,
      this.number,
      this.sort,
      this.numberOfElements,
      this.first,
      this.empty});

  Pdfmodel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    pageable = json['pageable'] != null
        ? new Pageable.fromJson(json['pageable'])
        : null;
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    last = json['last'];
    size = json['size'];
    number = json['number'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    if (this.pageable != null) {
      data['pageable'] = this.pageable!.toJson();
    }
    data['totalPages'] = this.totalPages;
    data['totalElements'] = this.totalElements;
    data['last'] = this.last;
    data['size'] = this.size;
    data['number'] = this.number;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['numberOfElements'] = this.numberOfElements;
    data['first'] = this.first;
    data['empty'] = this.empty;
    return data;
  }
}

class Content {
  String? processFlag;
  String? traceNumber;
  String? cardReferenceNumber;
  String? instId;
  String? custId;
  String? productId;
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
  bool? internationalTrans;
  String? channelType;
  String? lastAccess;
  bool? matchedStatus;
  String? matchDescription;
  String? settlementDate;
  String? fundSource;

  Content(
      {this.processFlag,
      this.traceNumber,
      this.cardReferenceNumber,
      this.instId,
      this.custId,
      this.productId,
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
      this.internationalTrans,
      this.channelType,
      this.lastAccess,
      this.matchedStatus,
      this.matchDescription,
      this.settlementDate,
      this.fundSource});

  Content.fromJson(Map<String, dynamic> json) {
    processFlag = json['processFlag'];
    traceNumber = json['traceNumber'];
    cardReferenceNumber = json['cardReferenceNumber'];
    instId = json['instId'];
    custId = json['custId'];
    productId = json['productId'];
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
    internationalTrans = json['internationalTrans'];
    channelType = json['channelType'];
    lastAccess = json['lastAccess'];
    matchedStatus = json['matchedStatus'];
    matchDescription = json['matchDescription'];
    settlementDate = json['settlementDate'];
    fundSource = json['fundSource'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['processFlag'] = this.processFlag;
    data['traceNumber'] = this.traceNumber;
    data['cardReferenceNumber'] = this.cardReferenceNumber;
    data['instId'] = this.instId;
    data['custId'] = this.custId;
    data['productId'] = this.productId;
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
    data['internationalTrans'] = this.internationalTrans;
    data['channelType'] = this.channelType;
    data['lastAccess'] = this.lastAccess;
    data['matchedStatus'] = this.matchedStatus;
    data['matchDescription'] = this.matchDescription;
    data['settlementDate'] = this.settlementDate;
    data['fundSource'] = this.fundSource;
    return data;
  }
}

class Pageable {
  Sort? sort;
  int? offset;
  int? pageSize;
  int? pageNumber;
  bool? unpaged;
  bool? paged;

  Pageable(
      {this.sort,
      this.offset,
      this.pageSize,
      this.pageNumber,
      this.unpaged,
      this.paged});

  Pageable.fromJson(Map<String, dynamic> json) {
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    pageSize = json['pageSize'];
    pageNumber = json['pageNumber'];
    unpaged = json['unpaged'];
    paged = json['paged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['offset'] = this.offset;
    data['pageSize'] = this.pageSize;
    data['pageNumber'] = this.pageNumber;
    data['unpaged'] = this.unpaged;
    data['paged'] = this.paged;
    return data;
  }
}

class Sort {
  bool? unsorted;
  bool? sorted;
  bool? empty;

  Sort({this.unsorted, this.sorted, this.empty});

  Sort.fromJson(Map<String, dynamic> json) {
    unsorted = json['unsorted'];
    sorted = json['sorted'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unsorted'] = this.unsorted;
    data['sorted'] = this.sorted;
    data['empty'] = this.empty;
    return data;
  }
}