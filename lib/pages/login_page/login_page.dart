import 'package:user_test/utils/barrel.dart';

class LoginPage extends BaseView {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseViewState{
  @override
  Widget builder(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.home);
      },
      child: Container(
        height: 100,
        color: Colors.red,
      ),
    );
  }
}
