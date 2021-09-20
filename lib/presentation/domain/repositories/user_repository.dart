import 'package:dartz/dartz.dart';
import 'package:user_test/core/core.dart';

abstract class UserRepository {
  Future<Either<Failure,String>> storeUser();
}
