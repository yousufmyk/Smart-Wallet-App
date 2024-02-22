class locations {
  String? responseCode;
  String? responseMessage;
  List<LocationCoOrdinates>? locationCoOrdinates;

  locations(
      {this.responseCode, this.responseMessage, this.locationCoOrdinates});

  locations.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
    if (json['locationCoOrdinates'] != null) {
      locationCoOrdinates = <LocationCoOrdinates>[];
      json['locationCoOrdinates'].forEach((v) {
        locationCoOrdinates!.add(new LocationCoOrdinates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    if (this.locationCoOrdinates != null) {
      data['locationCoOrdinates'] =
          this.locationCoOrdinates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocationCoOrdinates {
  double? latitude;
  double? longitude;
  double? km;

  LocationCoOrdinates({this.latitude, this.longitude, this.km});

  LocationCoOrdinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    km = json['km'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['km'] = this.km;
    return data;
  }
}
