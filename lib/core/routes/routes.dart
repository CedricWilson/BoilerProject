import 'package:user_test/di/pages.dart';
import 'package:user_test/presentation/utils/barrel.dart';

class Routes {
  static String get login => '/login';
  static String get home => '/home';

  static final routes = [
    Screen(
      name: home,
      page: () => HomePage(),
    ),
    Screen(
      name: login,
      page: () => LoginPage(),
    ),
  ];
}
