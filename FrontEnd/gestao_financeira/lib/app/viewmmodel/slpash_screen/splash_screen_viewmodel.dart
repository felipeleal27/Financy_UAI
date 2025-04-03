import 'package:gestao_financeira/app/database/local_storage/local_storage.dart';
import 'package:gestao_financeira/app/repository/splash_screen_repository/splash_screen_repository.dart';
import 'package:mobx/mobx.dart';

part 'splash_screen_viewmodel.g.dart';

class SplashScreenViewmodel = SplashScreenViewmodelBase
    with _$SplashScreenViewmodel;

abstract class SplashScreenViewmodelBase with Store {
  final SplashScreenRepository _splashScreenRepository;
  final LocalStorage _localStorage;

  SplashScreenViewmodelBase({
    required SplashScreenRepository splashScreenRepository,
    required LocalStorage localStorage,
  })  : _splashScreenRepository = splashScreenRepository,
        _localStorage = localStorage;

  @observable
  Duration? timer;

  Future<void> calcularSaldo() async {
    await _splashScreenRepository.calcularSaldoTotal();
  }

  @observable
  bool isDark = false;

  @action
  Future<void> setTheme() async {
    isDark = await _localStorage.isThemeDark();
  }


}
