import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_financeira/app/database/local_storage/local_storage.dart';
import 'package:gestao_financeira/app/database/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';
import 'package:gestao_financeira/app/repository/home_repository/home_repository.dart';
import 'package:gestao_financeira/app/repository/home_repository/home_repository_impl.dart';
import 'package:gestao_financeira/app/repository/splash_screen_repository/splash_screen_repository.dart';
import 'package:gestao_financeira/app/repository/splash_screen_repository/splash_screen_repository_impl.dart';
import 'package:gestao_financeira/app/service/rest_client/dio/dio_rest_client.dart';
import 'package:gestao_financeira/app/service/rest_client/exceptions/rest_client.dart';

class CoreModule extends Module {

  @override
  void exportedBinds(Injector i) {
    i.addSingleton<RestClient>(DioRestClient.new);

    //Repositories
    i.addSingleton<LocalStorage>(SharedPreferencesLocalStorageImpl.new);
    i.addSingleton<HomeRepository>(HomeRepositoryImpl.new);
    i.addSingleton<SplashScreenRepository>(SplashScreenRepositoryImpl.new);
  }
  
}