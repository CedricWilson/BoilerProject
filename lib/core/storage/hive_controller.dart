
import 'package:user_test/presentation/utils/barrel.dart';

import '../core.dart';

class HiveController extends GetxController {
  HiveStorage storage;

  HiveController({required this.storage});

  saveUser(User user) {
    

    if (user.userId != null) {
      Global.userId = user.userId;
    }

    storage.saveUser(user);
  }
}
