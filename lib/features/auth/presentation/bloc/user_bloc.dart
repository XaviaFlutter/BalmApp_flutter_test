import 'package:balm_test/features/auth/domain/user_entity.dart';
import 'package:balm_test/features/auth/domain/user_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FetchAllUsers _fetchAllUsers;

  UserBloc({required FetchAllUsers fetchAllUsers})
      : _fetchAllUsers = fetchAllUsers,
        super(UserInitial()) {
    on<UserFetch>(_onFetchUsers);
    on<UserSearch>(_onSearchUsers);
    on<UserSort>(_onSortUsers);
  }

  Future<void> _onFetchUsers(UserFetch event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      final users = await _fetchAllUsers.call();

      final sortedUsers = List<UserEntity>.from(users)
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

      emit(UserLoaded(
        users: sortedUsers,
        filteredUsers: sortedUsers,
        isAscending: true,
      ));
    } catch (e) {
      emit(UserFailure(message: e.toString()));
    }
  }

  Future<void> _onSearchUsers(UserSearch event, Emitter<UserState> emit) async {
    if (state is UserLoaded) {
      final currentState = state as UserLoaded;
      final filteredUsers = currentState.users
          .where((user) =>
              user.name.toLowerCase().contains(event.query.toLowerCase()) ||
              user.email.toLowerCase().contains(event.query.toLowerCase()))
          .toList();

      emit(UserLoaded(
        users: currentState.users,
        filteredUsers: filteredUsers,
      ));
    }
  }

  Future<void> _onSortUsers(UserSort event, Emitter<UserState> emit) async {
    if (state is UserLoaded) {
      final currentState = state as UserLoaded;

      final sortedUsers = List<UserEntity>.from(currentState.filteredUsers)
        ..sort((a, b) {
          final comparison =
              a.name.toLowerCase().compareTo(b.name.toLowerCase());
          return event.ascending ? comparison : -comparison;
        });

      emit(UserLoaded(
        isAscending: event.ascending,
        users: currentState.users,
        filteredUsers: sortedUsers,
      ));
    }
  }
}
