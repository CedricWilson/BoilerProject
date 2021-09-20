import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:user_test/core/core.dart';
import 'package:user_test/di/di.dart';

class User {
  String? name;
  String? userId;
  String? email;

  User({this.email, this.userId, this.name});

  void save() {
    final x = Get.put(si<HiveController>());
    x.saveUser(this);
  }
}
