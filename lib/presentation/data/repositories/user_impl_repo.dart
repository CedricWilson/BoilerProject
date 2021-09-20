import 'package:dartz/dartz.dart';
import 'package:user_test/core/core.dart';
import 'package:user_test/presentation/data/data.dart';
import 'package:user_test/presentation/domain/repositories/repositories.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDatasource datasource;

  UserRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure,String>> storeUser() async {
    return await datasource.storeUser();
  }
}
