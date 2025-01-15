import 'package:balm_test/core/routes/app_router.dart';
import 'package:balm_test/core/service/service_locator.dart';
import 'package:balm_test/core/service/service_user.dart';
import 'package:balm_test/features/auth/domain/user_use_case.dart';
import 'package:balm_test/features/auth/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _rootRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) {
          final fetchAllUsers = getIt<FetchAllUsers>();
          return UserBloc(fetchAllUsers: fetchAllUsers);
        })
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _rootRouter.config(),
      ),
    );
  }
}
