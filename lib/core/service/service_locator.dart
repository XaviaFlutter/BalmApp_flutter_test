import 'package:balm_test/core/service/service_user.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  setupServiceUsers();
}
