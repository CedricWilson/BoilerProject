import 'package:user_test/pages/homepage/homepage_view.dart';
import 'package:user_test/pages/login_page/login_page.dart';
import 'package:user_test/utils/barrel.dart';

class Routes {
  static String login = "/login";
  static String home = "/home";

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
