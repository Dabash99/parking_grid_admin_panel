class MessageS {
  String message;
  String message1;

  MessageS({this.message,this.message1});

  MessageS.fromJson(Map<String, dynamic> json) {
    message = json['message '];
    message1 = json['message'];
  }
}
