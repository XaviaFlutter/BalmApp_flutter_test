import 'package:balm_test/features/auth/data/user_model.dart';
import 'package:dio/dio.dart';

class RemoteDataSource {
  final Dio dio;

  RemoteDataSource()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'https://jsonplaceholder.typicode.com/users',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

  Future<UserModel> fetchUserById(int id) async {
    try {
      final response = await dio.get('/$id');
      print(response.data);
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception('Ошибка загрузки пользователя');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.data['message'] ?? 'Ошибка на сервере');
      } else {
        throw Exception('Ошибка сети: ${e.message}');
      }
    }
  }
}
