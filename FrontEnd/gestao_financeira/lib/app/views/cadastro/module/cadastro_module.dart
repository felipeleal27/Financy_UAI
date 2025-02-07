import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_financeira/app/core_module.dart';
import 'package:gestao_financeira/app/views/cadastro/cadastro_page.dart';
import 'package:gestao_financeira/app/views/cadastro/module/cadastro_nome_rotas.dart';

class CadastroModule extends Module {

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    // i.addLazySingleton<LoginRepository>(LoginRepositoryImpl.new);
    // i.addLazySingleton(LoginViewModel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(CadastroNomeRotas.cadastro, child: (context) => const CadastroPage());
    //r.module("${LoginNomeRotas.inicial}${Cadastro.modulo}", module: CadastroModule());
  }
}