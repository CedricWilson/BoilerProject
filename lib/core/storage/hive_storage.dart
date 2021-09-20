import 'package:hive/hive.dart';

import '../core.dart';

enum Type { UserId, Name, Email }

class HiveStorage {
  Box<dynamic> box;

  HiveStorage({required this.box});

  static get userId => 'userid';
  static get name => 'name';
  static get email => 'email';

  void saveUser(User user) {

    _save(Type.UserId, user.userId);
    _save(Type.Name, user.name);
    _save(Type.Email, user.email);

    getUser();
  }

  getUser() {
    print('Current User: ' +
        box.get(userId) +
        ' ' +
        box.get(name) +
        ' ' +
        box.get(email));
  }

  _save(Type type, dynamic val) {
    if (val != null) {
      box.put(_getKeyType(type), val);
    }
  }

  String _getKeyType(Type type) {
    switch (type) {
      case Type.Name:
        return name;
      case Type.UserId:
        return userId;
      case Type.Email:
        return email;
    }
  }
}
