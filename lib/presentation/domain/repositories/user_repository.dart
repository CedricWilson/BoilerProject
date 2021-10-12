import 'package:dartz/dartz.dart';
import 'package:user_test/core/core.dart';
import 'package:user_test/presentation/data/data.dart';

abstract class UserRepository {
  Future<Either<Failure,EmployeeModel>> storeUser();
}
