import 'package:dartz/dartz.dart';
import 'package:user_test/core/core.dart';
import 'package:user_test/presentation/data/data.dart';
import 'package:user_test/presentation/domain/domain.dart';

class TestUsecase{
  final UserRepository userRepository;

  TestUsecase({required this.userRepository});

  Future<Either<Failure,EmployeeModel>> call() async{
    return await userRepository.storeUser();
  }
}