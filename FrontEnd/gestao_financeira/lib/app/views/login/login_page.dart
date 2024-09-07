import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_financeira/app/viewmmodel/login/login_viewmodel.dart';
import 'package:gestao_financeira/app/views/login/widget_form_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final viewmodel = Modular.get<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetFormLogin(viewmodel: viewmodel),
    );
  }
}
