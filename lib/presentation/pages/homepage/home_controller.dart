import 'package:user_test/core/core.dart';
import 'package:user_test/presentation/domain/usecases/save_user.dart';
import 'package:user_test/presentation/utils/utils.dart';

class HomeController extends GetxController {
  SaveUsecase? saveUsecase;

  HomeController({this.saveUsecase});

  @override
  void onInit() {
    super.onInit();
    // fetchApi();
  }

  fetchApi() async {
    var response = await saveUsecase!.call();

    response.fold((failure) async {
      print('HomeController: ' + failure.message);
    }, (result) async {
      print(result);
    });
  }

  saveUser() {
    User(
      userId: '34',
      name: 'Vaibav',
    ).save();
  }

  fetchUser() {
    print(User()().email);
  }
}
