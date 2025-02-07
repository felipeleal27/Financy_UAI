import 'package:flutter/material.dart';
import 'package:gestao_financeira/app/views/cadastro/widget_form_cadastro.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WidgetFormCadastro(),
    );
  }
}
