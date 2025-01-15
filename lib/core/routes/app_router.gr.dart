// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:balm_test/features/auth/presentation/screens/init_screen.dart'
    as _i1;
import 'package:balm_test/features/auth/presentation/screens/user_detail_screen.dart'
    as _i2;
import 'package:flutter/material.dart' as _i4;

/// generated route for
/// [_i1.InitScreen]
class InitRoute extends _i3.PageRouteInfo<void> {
  const InitRoute({List<_i3.PageRouteInfo>? children})
    : super(InitRoute.name, initialChildren: children);

  static const String name = 'InitRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.InitScreen();
    },
  );
}

/// generated route for
/// [_i2.UserDetailScreen]
class UserDetailRoute extends _i3.PageRouteInfo<UserDetailRouteArgs> {
  UserDetailRoute({
    _i4.Key? key,
    required String username,
    required String name,
    required String email,
    required String street,
    required String suite,
    required String city,
    required String zipcode,
    required String lat,
    required String lng,
    required String phone,
    required String website,
    required String companyName,
    required String companyPhrase,
    required String bs,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         UserDetailRoute.name,
         args: UserDetailRouteArgs(
           key: key,
           username: username,
           name: name,
           email: email,
           street: street,
           suite: suite,
           city: city,
           zipcode: zipcode,
           lat: lat,
           lng: lng,
           phone: phone,
           website: website,
           companyName: companyName,
           companyPhrase: companyPhrase,
           bs: bs,
         ),
         initialChildren: children,
       );

  static const String name = 'UserDetailRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserDetailRouteArgs>();
      return _i2.UserDetailScreen(
        key: args.key,
        username: args.username,
        name: args.name,
        email: args.email,
        street: args.street,
        suite: args.suite,
        city: args.city,
        zipcode: args.zipcode,
        lat: args.lat,
        lng: args.lng,
        phone: args.phone,
        website: args.website,
        companyName: args.companyName,
        companyPhrase: args.companyPhrase,
        bs: args.bs,
      );
    },
  );
}

class UserDetailRouteArgs {
  const UserDetailRouteArgs({
    this.key,
    required this.username,
    required this.name,
    required this.email,
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.lat,
    required this.lng,
    required this.phone,
    required this.website,
    required this.companyName,
    required this.companyPhrase,
    required this.bs,
  });

  final _i4.Key? key;

  final String username;

  final String name;

  final String email;

  final String street;

  final String suite;

  final String city;

  final String zipcode;

  final String lat;

  final String lng;

  final String phone;

  final String website;

  final String companyName;

  final String companyPhrase;

  final String bs;

  @override
  String toString() {
    return 'UserDetailRouteArgs{key: $key, username: $username, name: $name, email: $email, street: $street, suite: $suite, city: $city, zipcode: $zipcode, lat: $lat, lng: $lng, phone: $phone, website: $website, companyName: $companyName, companyPhrase: $companyPhrase, bs: $bs}';
  }
}
