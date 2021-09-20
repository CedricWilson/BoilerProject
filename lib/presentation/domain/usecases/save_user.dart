import 'package:dartz/dartz.dart';
import 'package:user_test/core/core.dart';
import 'package:user_test/presentation/data/data.dart';
import 'package:user_test/presentation/domain/domain.dart';

class SaveUsecase{
  final UserRepository userRepository;

  SaveUsecase({required this.userRepository});

  Future<Either<Failure,String>> call() async{
    return await userRepository.storeUser();
  }
}