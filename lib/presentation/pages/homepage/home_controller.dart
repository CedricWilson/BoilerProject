import 'package:user_test/core/core.dart';
import 'package:user_test/presentation/domain/usecases/test_object.dart';
import 'package:user_test/presentation/utils/utils.dart';

class HomeController extends GetxController {
  TestUsecase? testUsecase;

  HomeController(this.testUsecase);

  @override
  void onInit() {
    super.onInit();
    // fetchApi();
  }

  fetchApi() async {
    var response = await testUsecase!.call();

    response.fold((failure) async {
      print('HomeController: ' + failure.message);
    }, (result) async {
      print(result.toJson());
    });
  }

  saveUser() {
    User(
      userId: '34',
      name: 'Vaibav',
    ).save();
  }

  fetchUser() {
    // print(User()().email);
    print(User().toString());
  }
}
