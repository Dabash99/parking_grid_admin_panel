class AllUsersdata {
  List<Users> users;

  AllUsersdata({this.users});

  AllUsersdata.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = new List<Users>();
      json['users'].forEach((v) {
        users.add(new Users.fromJson(v));
      });
    }
  }

}

class Users {
  List<String> carNumber;
  List<String> carLetter;
  String sId;
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;


  Users(
      {this.carNumber,
        this.carLetter,
        this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.phoneNumber});

  Users.fromJson(Map<String, dynamic> json) {
    carNumber = json['carNumber'].cast<String>();
    carLetter = json['carLetter'].cast<String>();
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];

  }

}
