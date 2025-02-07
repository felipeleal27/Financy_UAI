import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_financeira/app/core_module.dart';
import 'package:gestao_financeira/app/viewmmodel/home/home_viewmodel.dart';
import 'package:gestao_financeira/app/views/configuracoes/module/configuracoes_module.dart';
import 'package:gestao_financeira/app/views/configuracoes/module/configuracoes_nome_rotas.dart';
import 'package:gestao_financeira/app/views/home/home_page.dart';
import 'package:gestao_financeira/app/views/home/module/home_nome_rotas.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(HomeViewmodel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(HomeNomeRotas.inicial, child: (context) => const HomePage());
    r.module("${HomeNomeRotas.inicial}${ConfiguracoesNomeRotas.modulo}", module: ConfiguracoesModule());
  }
}