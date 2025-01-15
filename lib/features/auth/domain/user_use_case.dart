import 'package:balm_test/features/auth/domain/user_entity.dart';
import 'package:balm_test/features/auth/domain/user_repository.dart';

class FetchAllUsers {
  final UserRepository repository;

  FetchAllUsers({required this.repository});

  Future<List<UserEntity>> call() async {
    try {
      return await repository.fetchAllUsers();
    } catch (e) {
      throw Exception('Ошибка $e');
    }
  }
}
