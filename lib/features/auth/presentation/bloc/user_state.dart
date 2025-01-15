part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final List<UserEntity> users;
  final List<UserEntity> filteredUsers;
  bool isAscending;

  UserLoaded(
      {required this.users,
      required this.filteredUsers,
      this.isAscending = true});
}

final class UserLoading extends UserState {}

final class UserFailure extends UserState {
  final String message;

  UserFailure({required this.message});
}
