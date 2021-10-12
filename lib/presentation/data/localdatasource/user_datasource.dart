import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:user_test/core/core.dart';

abstract class UserDatasource {
  Future<Either<Failure, String>> storeUser();
}

class UserDatasourceImpl extends UserDatasource {
  final Api api;

  UserDatasourceImpl({required this.api});

  @override
  Future<Either<Failure, String>> storeUser() async {
    return Left(Failure(message: 'Error'));
  }
}
