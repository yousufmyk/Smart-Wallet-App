class CxDetailsModel {
  String? responseCode;
  String? responseMessage;
  String? walletAccountNumber;
  Customer? customer;

  CxDetailsModel(
      {this.responseCode,
      this.responseMessage,
      this.walletAccountNumber,
      this.customer});

  CxDetailsModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
    walletAccountNumber = json['walletAccountNumber'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    data['walletAccountNumber'] = this.walletAccountNumber;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Customer {
  String? custId;
  String? instId;
  String? mobileCountryCode;
  String? mobileNumber;
  String? emailId;
  String? firstName;
  String? lastName;
  Null? dob;
  Null? fatherName;
  Null? motherName;
  Null? address;
  Null? city;
  Null? district;
  Null? state;
  Null? country;
  Null? postalCode;
  Null? profilePicture;
  String? kycType;
  bool? kycStatus;
  Null? biometricData;
  Null? otp;
  Null? otpExpiry;
  String? lastAccess;
  Null? kycFrontImage;
  Null? kycBackImage;
  String? kycDocOneName;
  String? kycDocTwoName;
  String? registredAt;
  String? status;
  bool? otpVerified;
  Null? salary;
  Null? nickName;
  String? customerFrontKycImg;
  String? customerBackKycImg;
  Null? merchantId;
  Null? allDocuments;
  String? kycExpiry;

  Customer(
      {this.custId,
      this.instId,
      this.mobileCountryCode,
      this.mobileNumber,
      this.emailId,
      this.firstName,
      this.lastName,
      this.dob,
      this.fatherName,
      this.motherName,
      this.address,
      this.city,
      this.district,
      this.state,
      this.country,
      this.postalCode,
      this.profilePicture,
      this.kycType,
      this.kycStatus,
      this.biometricData,
      this.otp,
      this.otpExpiry,
      this.lastAccess,
      this.kycFrontImage,
      this.kycBackImage,
      this.kycDocOneName,
      this.kycDocTwoName,
      this.registredAt,
      this.status,
      this.otpVerified,
      this.salary,
      this.nickName,
      this.customerFrontKycImg,
      this.customerBackKycImg,
      this.merchantId,
      this.allDocuments,
      this.kycExpiry});

  Customer.fromJson(Map<String, dynamic> json) {
    custId = json['custId'];
    instId = json['instId'];
    mobileCountryCode = json['mobileCountryCode'];
    mobileNumber = json['mobileNumber'];
    emailId = json['emailId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    dob = json['dob'];
    fatherName = json['fatherName'];
    motherName = json['motherName'];
    address = json['address'];
    city = json['city'];
    district = json['district'];
    state = json['state'];
    country = json['country'];
    postalCode = json['postalCode'];
    profilePicture = json['profilePicture'];
    kycType = json['kycType'];
    kycStatus = json['kycStatus'];
    biometricData = json['biometricData'];
    otp = json['otp'];
    otpExpiry = json['otpExpiry'];
    lastAccess = json['lastAccess'];
    kycFrontImage = json['kycFrontImage'];
    kycBackImage = json['kycBackImage'];
    kycDocOneName = json['kycDocOneName'];
    kycDocTwoName = json['kycDocTwoName'];
    registredAt = json['registredAt'];
    status = json['status'];
    otpVerified = json['otpVerified'];
    salary = json['salary'];
    nickName = json['nickName'];
    customerFrontKycImg = json['customerFrontKycImg'];
    customerBackKycImg = json['customerBackKycImg'];
    merchantId = json['merchantId'];
    allDocuments = json['allDocuments'];
    kycExpiry = json['kycExpiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custId'] = this.custId;
    data['instId'] = this.instId;
    data['mobileCountryCode'] = this.mobileCountryCode;
    data['mobileNumber'] = this.mobileNumber;
    data['emailId'] = this.emailId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['dob'] = this.dob;
    data['fatherName'] = this.fatherName;
    data['motherName'] = this.motherName;
    data['address'] = this.address;
    data['city'] = this.city;
    data['district'] = this.district;
    data['state'] = this.state;
    data['country'] = this.country;
    data['postalCode'] = this.postalCode;
    data['profilePicture'] = this.profilePicture;
    data['kycType'] = this.kycType;
    data['kycStatus'] = this.kycStatus;
    data['biometricData'] = this.biometricData;
    data['otp'] = this.otp;
    data['otpExpiry'] = this.otpExpiry;
    data['lastAccess'] = this.lastAccess;
    data['kycFrontImage'] = this.kycFrontImage;
    data['kycBackImage'] = this.kycBackImage;
    data['kycDocOneName'] = this.kycDocOneName;
    data['kycDocTwoName'] = this.kycDocTwoName;
    data['registredAt'] = this.registredAt;
    data['status'] = this.status;
    data['otpVerified'] = this.otpVerified;
    data['salary'] = this.salary;
    data['nickName'] = this.nickName;
    data['customerFrontKycImg'] = this.customerFrontKycImg;
    data['customerBackKycImg'] = this.customerBackKycImg;
    data['merchantId'] = this.merchantId;
    data['allDocuments'] = this.allDocuments;
    data['kycExpiry'] = this.kycExpiry;
    return data;
  }
}