
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_financeira/app/viewmmodel/slpash_screen/splash_screen_viewmodel.dart';
import 'package:gestao_financeira/app/views/splash_screen/module/splash_screen_nome_rotas.dart';
import 'package:gestao_financeira/app/views/splash_screen/splash_screen_page.dart';

class SplashScreenModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => SplashScreenViewmodel()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(SplashScreenNomeRotas.inicial, child: (context, args) => const SplashScreenPage()),
  ];
  
}