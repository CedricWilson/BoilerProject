import 'package:user_test/di/di.dart';
import 'package:user_test/presentation/utils/utils.dart';

class HomePage extends BaseView {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseViewState {
  var x = Get.put(si<HomeController>());

  @override
  Widget builder(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.toNamed(Routes.login);
        // x.fetchApi();
        x.fetchUser();
        // x.saveUser();
      },
      child: Container(
        height: 200,
        width: 200,
        color: Colors.black,
      ),
    );
  }
}
