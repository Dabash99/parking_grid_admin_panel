class GetAllParks {
  String sId;
  String cityName;
  String garageName;
  List<Parkings> parkings;

  GetAllParks({this.sId, this.cityName, this.garageName, this.parkings,});

  GetAllParks.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cityName = json['cityName'];
    garageName = json['garageName'];
    if (json['parkings'] != null) {
      parkings = new List<Parkings>();
      json['parkings'].forEach((v) {
        parkings.add(new Parkings.fromJson(v));
      });
    }
  }

}

class Parkings {
  UserData userData;
  String sId;
  String parkingFloor;
  String parkingName;
  String status;
  String Mode;

  bool selected =false;

  Parkings(
      {this.userData,
        this.sId,
        this.parkingFloor,
        this.parkingName,
        this.status});

  Parkings.fromJson(Map<String, dynamic> json) {
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
    sId = json['_id'];
    parkingFloor = json['parking_Floor'];
    parkingName = json['parking_Name'];
    status = json['status'];
    Mode =json['mode'];
  }

}

class UserData {
  String email;
  String phoneNumber;
  dynamic carNumber;
  dynamic carLetter;

  UserData({this.email, this.phoneNumber, this.carNumber, this.carLetter});

  UserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    carNumber = json['carNumber'];
    carLetter = json['carLetter'];
  }
}
