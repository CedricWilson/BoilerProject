import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:user_test/core/core.dart';
import 'package:user_test/di/di.dart';

part 'user_model.g.dart';

@HiveType(typeId: 2)
class User {
  @HiveField(0)
  String? userId;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? token;

  //!For every field added here please also add to HiveStorage in Core and
  //!(Optional) in 'toJson' below.

  User({this.userId, this.name, this.email, this.token});

  factory User._fetchUser() {
    return si<HiveController>().fetchUser();
  }

  User call() => User._fetchUser();

  void save() => si<HiveController>().saveUser(this);

  void verifyUser() {}

  @override
  String toString() => {
        'userId': userId,
        'name': name,
        'email': email,
        'token': token
      }.toString();

  void removeUser() {}
}
