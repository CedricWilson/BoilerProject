import 'package:user_test/utils/barrel.dart';

class HomePage extends BaseView {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseViewState{
  @override
  Widget builder(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.home);
      },
      child: Container(
        height: 200,
        color: Colors.black,
      ),
    );
  }
  
}
