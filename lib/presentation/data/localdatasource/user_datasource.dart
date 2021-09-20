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
    try {
      var response = await api.call(HTTP.GET, ApiPath.test);
      return response.fold((failure) {
        return Left(failure);
      }, (result) async {
       
        return Right(result.data.toString());
      });
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
