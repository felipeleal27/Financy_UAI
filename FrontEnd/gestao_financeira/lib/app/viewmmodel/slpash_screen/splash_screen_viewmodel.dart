import 'package:gestao_financeira/app/repository/splash_screen_repository/splash_screen_repository.dart';
import 'package:mobx/mobx.dart';

part 'splash_screen_viewmodel.g.dart';

class SplashScreenViewmodel = SplashScreenViewmodelBase
    with _$SplashScreenViewmodel;

abstract class SplashScreenViewmodelBase with Store {
  final SplashScreenRepository _splashScreenRepository;

  SplashScreenViewmodelBase({
    required SplashScreenRepository splashScreenRepository,
  }) : _splashScreenRepository = splashScreenRepository;

  @observable
  Duration? timer;

  Future<void> calcularSaldo() async {
    await _splashScreenRepository.calcularSaldoTotal();
  }

  
}
