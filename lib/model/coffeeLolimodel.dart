// To parse this JSON data, do
//
//     final CoffeeLoli = CoffeeLoliFromJson(jsonString);

import 'dart:convert';

CoffeeLoli CoffeeLoliFromJson(String str) => CoffeeLoli.fromJson(json.decode(str));

String CoffeeLoliToJson(CoffeeLoli data) => json.encode(data.toJson());

class CoffeeLoli {
  final String desc;
  final String image;
  final String name;
  final String price;
  final String rate;
  final String shortDesc;
  final String type;

  CoffeeLoli({
    required this.desc,
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    required this.shortDesc,
    required this.type,
  });

  factory CoffeeLoli.fromJson(Map<String, dynamic> json) => CoffeeLoli(
        desc: json["desc"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        rate: json["rate"],
        shortDesc: json["shortDesc"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "image": image,
        "name": name,
        "price": price,
        "rate": rate,
        "shortDesc": shortDesc,
        "type": type,
      };
}
class MyUser {
  String? idUser;
  String? nama;
  String? email;
  String? noTlp;

  MyUser({
    this.idUser,
    this.nama,
    this.email,
    this.noTlp,
  });

  MyUser.fromJson(Map<String, dynamic> json) {
    idUser = json['idUser']; // Change this to 'idUser'
    nama = json['nama'];
    email = json['email'];
    noTlp = json['noTlp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUser'] = this.idUser; // Change this to 'idUser'
    data['nama'] = this.nama;
    data['email'] = this.email;
    data['noTlp'] = this.noTlp;
    return data;
  }
}
