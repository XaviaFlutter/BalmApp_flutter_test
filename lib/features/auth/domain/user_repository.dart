import 'user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> fetchAllUsers();
}
