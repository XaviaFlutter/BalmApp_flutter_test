part of 'user_bloc.dart';

sealed class UserEvent {}

class UserFetch extends UserEvent {}

class UserSearch extends UserEvent {
  final String query;

  UserSearch(this.query);
}

class UserSort extends UserEvent {
  final bool ascending;
  UserSort({required this.ascending});
}
