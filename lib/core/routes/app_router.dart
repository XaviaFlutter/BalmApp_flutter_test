import 'package:auto_route/auto_route.dart';
import 'package:balm_test/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: InitRoute.page, initial: true),
        AutoRoute(page: UserDetailRoute.page)
      ];
}
