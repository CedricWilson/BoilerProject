import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:user_test/core/core.dart';
import 'package:user_test/core/network/network_info.dart';
import 'package:user_test/presentation/utils/utils.dart';
import 'package:user_test/presentation/data/data.dart';
import 'package:user_test/presentation/domain/domain.dart';

GetIt si = GetIt.instance;

Future<void> init() async {
  si.registerFactory(() => HomeController(saveUsecase: si()));
  si.registerFactory(() => HiveController(storage: si()));

//-----------------------------------Usecase-----------------------------------------------//

  si.registerLazySingleton<SaveUsecase>(
      () => SaveUsecase(userRepository: si()));

//------------------------------------Repo-------------------------------------------------//

  si.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(datasource: si()));

//------------------------------------Datasource-------------------------------------------//

  si.registerLazySingleton<UserDatasource>(() => UserDatasourceImpl(api: si()));

//---------------------------------Singletons----------------------------------------------//

  Box<dynamic> userBox = await Hive.openBox('user', encryptionCipher: getKey());
  si.registerLazySingleton<Box<dynamic>>(() => userBox);

  si.registerLazySingleton<Dio>(() => Dio(BaseOptions(
        connectTimeout: 30000,
        receiveTimeout: 30000,
        receiveDataWhenStatusError: true,
      )));

  si.registerLazySingleton<Connectivity>(() => Connectivity());
  si.registerLazySingleton<HiveStorage>(() => HiveStorage(box: si()));

  si.registerLazySingleton<Api>(() => Api(dio: si(), networkInfo: si()));
  si.registerLazySingleton<NetworkInfo>(() => NetworkInfo(connectivity: si()));
}
