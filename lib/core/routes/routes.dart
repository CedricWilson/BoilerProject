import 'package:user_test/presentation/utils/utils.dart';

class Routes {
  static String get login => '/login';
  static String get home => '/home';

  static final routes = [
    Screen(name: home, page: () => HomePage()),
    Screen(name: login, page: () => LoginPage()),
  ];
}
