import 'dart:convert';

import 'package:balm_test/features/auth/domain/user_entity.dart';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

class UserModel extends UserEntity {
  UserModel(
      {required super.id,
      required super.name,
      required super.username,
      required super.email,
      required super.address,
      required super.phone,
      required super.website,
      required super.company});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromJson(json["company"]),
      );
}

class Address extends AddressEntity {
  Address(
      {required super.street,
      required super.suite,
      required super.city,
      required super.zipcode,
      required super.geo});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
      );
}

class Geo extends GeoEntity {
  Geo({required super.lat, required super.lng});
  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );
}

class Company extends CompanyEntity {
  Company({required super.name, required super.catchPhrase, required super.bs});
  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );
}
