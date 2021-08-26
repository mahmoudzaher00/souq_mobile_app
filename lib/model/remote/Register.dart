// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  Data data;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.name,
    this.email,
    this.phone,
    this.id,
    this.image,
    this.token,
  });

  String name;
  String email;
  String phone;
  int id;
  String image;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    id: json["id"],
    image: json["image"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "id": id,
    "image": image,
    "token": token,
  };
}
