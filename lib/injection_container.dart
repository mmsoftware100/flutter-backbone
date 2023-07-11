import 'package:base/features/data/const/data.dart';
import 'package:base/features/data/datasources/crypto_remote_data_source.dart';
import 'package:base/features/data/datasources/network_call.dart';
import 'package:base/features/data/datasources/user_remote_data_source.dart';
import 'package:base/features/data/repositories/crypto_repository_impl.dart';
import 'package:base/features/data/repositories/user_repository_impl.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:base/features/domain/usecases/select_crypto.dart';
import 'package:base/features/domain/usecases/user_login.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:base/features/presentation/providers/crpyto_provider.dart';
import 'package:base/features/presentation/providers/user_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'features/data/datasources/local_storage.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /* Factory ဆိုတာက App တစ်ခုလုံးမှာမှ တစ်ခုပဲ ရှိမယ့် ဟာမျိုးကို ဆိုလိုတာလား မသိ */
  /// Providers
  sl.registerFactory(
          () => CryptoProvider(
          // selectCrypto: sl(),
      )
  );
  sl.registerFactory(
          () => UserProvider(
          //userLogin: sl(),
          //userRegister: sl(),
          //userUpdate: sl(),
          //localStorage: sl()
      )
  );

  // ဒီကောင်က implement လုပ်ထားတဲ့ class
  /// Use Cases
  sl.registerLazySingleton<UserLogin>(() =>  UserLogin(userRepository: sl()));
  sl.registerLazySingleton<UserRegister>(() =>  UserRegister(userRepository: sl()));
  sl.registerLazySingleton<SelectCrypto>(() =>  SelectCrypto(cryptoRepository: sl()));


  // ဒါလည်း အတူတူပဲ
  /// Repositories
  //sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userRemoteDataSource: sl()));
  sl.registerLazySingleton<LocalStorage>(() => LocalStorageImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<CryptoRepository>(() => CryptoRepositoryImpl(cryptoRemoteDataSource: sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userRemoteDataSource: sl() ));

  // remote data source
  //sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(networkCall: sl()));
  sl.registerLazySingleton<CryptoRemoteDataSource>(() => CryptoRemoteDataSourceImpl(networkCall: sl()));
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(networkCall: sl()));

  // external
  // DIO က လည်း အမှန်တော့ Abstract တစ်ခု ခံပြီးသုံးသင့်တာ။
  // အခုတော့ ဒီအတိုင်း သုံးထားတယ်၊ နောက်တော့ ပြောင်းရမယ်

  // Network
  sl.registerLazySingleton<NetworkCall>(() => NetworkCallImpl(client: sl()));

  sl.registerLazySingleton(() => Dio());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
