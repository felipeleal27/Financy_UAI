
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_financeira/app/core_module.dart';
import 'package:gestao_financeira/app/viewmmodel/slpash_screen/splash_screen_viewmodel.dart';
import 'package:gestao_financeira/app/views/splash_screen/module/splash_screen_nome_rotas.dart';
import 'package:gestao_financeira/app/views/splash_screen/splash_screen_page.dart';

class SplashScreenModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(SplashScreenViewmodel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(SplashScreenNomeRotas.inicial, child: (context) => const SplashScreenPage());
  }
}