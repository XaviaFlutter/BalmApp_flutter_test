class UserEntity {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressEntity address;
  final String phone;
  final String website;
  final CompanyEntity company;

  UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });
}

class AddressEntity {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoEntity geo;

  AddressEntity({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
}

class GeoEntity {
  final String lat;
  final String lng;

  GeoEntity({
    required this.lat,
    required this.lng,
  });
}

class CompanyEntity {
  final String name;
  final String catchPhrase;
  final String bs;

  CompanyEntity({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });
}
