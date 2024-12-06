import 'package:mobx/mobx.dart';

part 'splash_screen_viewmodel.g.dart';

class SplashScreenViewmodel = SplashScreenViewmodelBase
    with _$SplashScreenViewmodel;

abstract class SplashScreenViewmodelBase with Store {
  @observable
  Duration? timer;
}
