import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_financeira/app/core_module.dart';
import 'package:gestao_financeira/app/views/home/module/home_module.dart';
import 'package:gestao_financeira/app/views/home/module/home_nome_rotas.dart';
import 'package:gestao_financeira/app/views/login/module/login_module.dart';
import 'package:gestao_financeira/app/views/login/module/login_nome_rotas.dart';
import 'package:gestao_financeira/app/views/splash_screen/module/splash_screen_module.dart';
import 'package:gestao_financeira/app/views/splash_screen/module/splash_screen_nome_rotas.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {}

  @override
  void routes(r) {
    r.module(SplashScreenNomeRotas.modulo, module: SplashScreenModule());
    r.module(LoginNomeRotas.modulo, module: LoginModule());
    r.module(HomeNomeRotas.modulo, module: HomeModule());
  }
}