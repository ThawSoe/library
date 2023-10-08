import 'dart:convert';

class UserDTO {
  String? userName;
  String? psw;

  UserDTO({this.userName, this.psw});

  UserDTO.fromJson(Map<String, dynamic> json) {
    userName = json['username'];
    psw = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {'username': userName, 'password': psw};
  }
}

List<UserDTO> registerUserFromJson(String str) =>
    List<UserDTO>.from(json.decode(str).map((x) => UserDTO.fromJson(x)));

String registerUserToJson(List<UserDTO> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
