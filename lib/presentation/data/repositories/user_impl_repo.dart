import 'package:dartz/dartz.dart';
import 'package:user_test/core/core.dart';
import 'package:user_test/presentation/data/data.dart';
import 'package:user_test/presentation/data/remotedatasource/testdatasource/test_datasource.dart';
import 'package:user_test/presentation/domain/repositories/repositories.dart';

class UserRepositoryImpl extends UserRepository {
  final TestDatasource datasource;

  UserRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure,EmployeeModel>> storeUser() async {
    return await datasource.testObject();
  }
}
