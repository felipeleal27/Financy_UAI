import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_financeira/app/views/cadastro/cadastro_page.dart';
import 'package:gestao_financeira/app/views/cadastro/module/cadastro_nome_rotas.dart';

class CadastroModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(CadastroNomeRotas.cadastro, child: (context, args) => const CadastroPage()),
  ];
}