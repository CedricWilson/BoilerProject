import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:user_test/core/core.dart';
import 'package:user_test/core/network/network_info.dart';
import 'package:user_test/presentation/utils/utils.dart';
import 'package:user_test/presentation/data/data.dart';
import 'package:user_test/presentation/domain/domain.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => HomeController(sl()));
  sl.registerFactory(() => HiveController(storage: sl()));

//-----------------------------------Usecase-----------------------------------------------//

  sl.registerLazySingleton<TestUsecase>(
      () => TestUsecase(userRepository: sl()));

//------------------------------------Repo-------------------------------------------------//

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

//------------------------------------Datasource-------------------------------------------//

  sl.registerLazySingleton<UserDatasource>(() => UserDatasourceImpl(api: sl()));
  sl.registerLazySingleton<TestDatasource>(() => ITestDatasource(api: sl()));

//---------------------------------Singletons----------------------------------------------//

  Box<dynamic> userBox = await Hive.openBox('user', encryptionCipher: getKey());
  sl.registerLazySingleton<Box<dynamic>>(() => userBox);

  sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      receiveDataWhenStatusError: true)));

  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<HiveStorage>(() => HiveStorage(box: sl()));

  sl.registerLazySingleton<Api>(() => Api(dio: sl(), networkInfo: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo(connectivity: sl()));
}
