import 'package:user_test/presentation/utils/utils.dart';

import '../core.dart';

class HiveController extends GetxController {
  HiveStorage? storage;

  HiveController({this.storage});

  void saveUser(User user) {
    if (user.userId != null) {
      Global.userId = user.userId;
    }
    // storage!.reset();
    storage!.saveUser(user);
  }

  User fetchUser() {
    return storage!.fetchUser();
  }

  bool verifyUser() {
    return true;
  }

  void removeUser() {}
}
