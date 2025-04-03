import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_financeira/app/core_module.dart';
import 'package:gestao_financeira/app/viewmmodel/configuracoes/configuracoes_viewmodel.dart';
import 'package:gestao_financeira/app/views/configuracoes/configuracoes_page.dart';
import 'package:gestao_financeira/app/views/configuracoes/module/configuracoes_nome_rotas.dart';

class ConfiguracoesModule extends Module {
  @override
  final List<Module> imports = [CoreModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(ConfiguracoesViewmodel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(ConfiguracoesNomeRotas.inicial, child: (context) => const ConfiguracoesPage());
  }
}