import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_financeira/app/core_module.dart';
import 'package:gestao_financeira/app/views/login/module/login_module.dart';
import 'package:gestao_financeira/app/views/login/module/login_nome_rotas.dart';
import 'package:gestao_financeira/app/views/splash_screen/module/splash_screen_module.dart';
import 'package:gestao_financeira/app/views/splash_screen/module/splash_screen_nome_rotas.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<Module> get imports => [CoreModule()];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(LoginNomeRotas.modulo, module: LoginModule()),
    ModuleRoute(SplashScreenNomeRotas.modulo, module: SplashScreenModule()),
  ];
}