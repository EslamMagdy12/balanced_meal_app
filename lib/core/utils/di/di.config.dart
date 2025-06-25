// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../features/order/data/api/order_retrofit_client.dart' as _i232;
import '../../../features/order/data/data_source/contract/order_remote_data_source.dart'
    as _i668;
import '../../../features/order/data/data_source/remote/order_remote_data_source_impl.dart'
    as _i562;
import '../../../features/order/data/repo_impl/order_repo_impl.dart' as _i659;
import '../../../features/order/domain/repo/order_repo.dart' as _i952;
import '../../../features/order/domain/use_case/get_carbs_use_case.dart'
    as _i68;
import '../../../features/order/domain/use_case/get_meats_use_case.dart'
    as _i731;
import '../../../features/order/domain/use_case/get_vegetables_use_case.dart'
    as _i1071;
import '../../../features/order/domain/use_case/place_order_use_case.dart'
    as _i406;
import '../../../features/order/presentation/view_model/order_cubit.dart'
    as _i610;
import '../../../features/user_details/presentation/view_model/user_details_cubit.dart'
    as _i136;
import '../bloc_observer/bloc_observer_service.dart' as _i649;
import '../datasource_execution/api_manager.dart' as _i984;
import '../datasource_execution/dio_module.dart' as _i183;
import '../firebase_module.dart' as _i1007;
import '../flutter_secure_storage_module.dart' as _i712;
import '../logging/logger_module.dart' as _i470;
import '../shared_preference_module.dart' as _i60;
import '../validator/validator.dart' as _i468;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferenceModule = _$SharedPreferenceModule();
    final firebaseModule = _$FirebaseModule();
    final secureStorageModule = _$SecureStorageModule();
    final loggerModule = _$LoggerModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferenceModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i468.Validator>(() => _i468.Validator());
    gh.singleton<_i984.ApiManager>(() => _i984.ApiManager());
    gh.lazySingleton<_i974.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => secureStorageModule.storage,
    );
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.singleton<_i649.BlocObserverService>(
      () => _i649.BlocObserverService(gh<_i974.Logger>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.provideDio(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i136.UserDetailsCubit>(
      () => _i136.UserDetailsCubit(gh<_i468.Validator>()),
    );
    gh.factory<_i232.OrderRetrofitClient>(
      () => _i232.OrderRetrofitClient(gh<_i361.Dio>()),
    );
    gh.factory<_i668.OrderRemoteDataSource>(
      () => _i562.OrderRemoteDataSourceImpl(
        gh<_i974.FirebaseFirestore>(),
        gh<_i232.OrderRetrofitClient>(),
      ),
    );
    gh.factory<_i952.OrderRepo>(
      () => _i659.OrderRepoImpl(
        gh<_i984.ApiManager>(),
        gh<_i668.OrderRemoteDataSource>(),
      ),
    );
    gh.factory<_i68.GetCarbsUseCase>(
      () => _i68.GetCarbsUseCase(gh<_i952.OrderRepo>()),
    );
    gh.factory<_i731.GetMeatsUseCase>(
      () => _i731.GetMeatsUseCase(gh<_i952.OrderRepo>()),
    );
    gh.factory<_i1071.GetVegetablesUseCase>(
      () => _i1071.GetVegetablesUseCase(gh<_i952.OrderRepo>()),
    );
    gh.factory<_i406.PlaceOrderUseCase>(
      () => _i406.PlaceOrderUseCase(gh<_i952.OrderRepo>()),
    );
    gh.factory<_i610.OrderCubit>(
      () => _i610.OrderCubit(
        gh<_i1071.GetVegetablesUseCase>(),
        gh<_i68.GetCarbsUseCase>(),
        gh<_i731.GetMeatsUseCase>(),
        gh<_i406.PlaceOrderUseCase>(),
      ),
    );
    return this;
  }
}

class _$SharedPreferenceModule extends _i60.SharedPreferenceModule {}

class _$FirebaseModule extends _i1007.FirebaseModule {}

class _$SecureStorageModule extends _i712.SecureStorageModule {}

class _$LoggerModule extends _i470.LoggerModule {}

class _$DioModule extends _i183.DioModule {}
