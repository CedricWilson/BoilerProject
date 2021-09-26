import 'package:hive/hive.dart';
import 'package:user_test/presentation/utils/utils.dart';

import '../core.dart';

class HiveStorage {
  Box<dynamic> box;

  HiveStorage({required this.box});

  void saveUser(User user) {
    if (box.length == 0) {
      box.add(user);
    } else {
      User userModel = box.getAt(0);
      //Add new variable here accordingly
      box.putAt(
        0,
        User(
            userId: user.userId ?? userModel.userId,
            name: user.name ?? userModel.name,
            email: user.email ?? userModel.email,
            token: Encryptor.encrypt(user.token) ?? userModel.token),
      );
    }

    printUser();
  }

  User fetchUser() {
    try {
      User user = box.getAt(0);
      user.token = Encryptor.decrypt(user.token);
      return user;
    } catch (e) {
      lg('Database not initialized Yet!');
      return User();
    }
  }

  printUser() {
    User user = box.getAt(0);
    print('Current User: ' + user.toJson().toString());
  }

  reset() {
    box.clear();
  }
}
