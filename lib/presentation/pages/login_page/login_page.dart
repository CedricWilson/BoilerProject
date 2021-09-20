import 'package:user_test/presentation/utils/barrel.dart';

class LoginPage extends BaseView {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseViewState{
  @override
  Widget builder(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(Routes.home);
      },
          child: Container(
          height: 300,
          color: Colors.red,
        ),
    );
  }
}
