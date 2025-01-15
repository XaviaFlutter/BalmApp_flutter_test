import 'package:balm_test/features/auth/data/user_model.dart';
import 'package:balm_test/features/auth/data/user_remote_data_source.dart';
import 'package:balm_test/features/auth/domain/user_entity.dart';
import 'package:balm_test/features/auth/domain/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<UserEntity>> fetchAllUsers() async {
    try {
      final response = await remoteDataSource.dio.get('/');
      final userList = (response.data as List)
          .map((userJson) => UserModel.fromJson(userJson))
          .toList();
      return userList;
    } catch (e) {
      throw Exception('Ошибка $e');
    }
  }
}
