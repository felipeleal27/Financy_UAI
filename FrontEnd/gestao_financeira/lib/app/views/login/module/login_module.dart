import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_financeira/app/core_module.dart';
import 'package:gestao_financeira/app/repository/login_repository/login_repository.dart';
import 'package:gestao_financeira/app/repository/login_repository/login_repository_impl.dart';
import 'package:gestao_financeira/app/viewmmodel/login/login_viewmodel.dart';
import 'package:gestao_financeira/app/views/login/login_page.dart';
import 'package:gestao_financeira/app/views/login/module/login_nome_rotas.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton<LoginRepository>(LoginRepositoryImpl.new);
    i.addLazySingleton(LoginViewModel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(LoginNomeRotas.login, child: (context) => const LoginPage());
    //r.module("${LoginNomeRotas.inicial}${Cadastro.modulo}", module: CadastroModule());
  }
}