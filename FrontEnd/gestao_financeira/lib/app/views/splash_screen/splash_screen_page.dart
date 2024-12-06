import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gestao_financeira/app/viewmmodel/slpash_screen/splash_screen_viewmodel.dart';
import 'package:gestao_financeira/app/views/login/module/login_nome_rotas.dart';
import 'package:lottie/lottie.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final viewmodel = Modular.get<SplashScreenViewmodel>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Modular.to.pushReplacementNamed("${LoginNomeRotas.modulo}${LoginNomeRotas.login}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return Container(
            color: Colors.white,
            child: Center(child: Lottie.asset('assets/lottie/loading.json')),
          );
        }
      ),
    );
  }
}
