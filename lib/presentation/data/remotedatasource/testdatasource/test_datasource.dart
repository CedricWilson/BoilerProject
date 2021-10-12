import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:user_test/core/core.dart';
import 'package:user_test/presentation/data/models/employee_model.dart';
import 'package:user_test/presentation/data/models/learn_model.dart';

abstract class TestDatasource {
  Future<Either<Failure, EmployeeModel>> testObject();
}

class ITestDatasource implements TestDatasource {
  final Api api;

  ITestDatasource({required this.api});

  @override
  Future<Either<Failure, EmployeeModel>> testObject() async {
    try {
      var response = await api.call(HTTP.GET, ApiPath.test);
      return response.fold((failure) {
        return Left(failure);
      }, (result) async {
        return Right(EmployeeModel.fromJson(result.data));
      });
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  
}
