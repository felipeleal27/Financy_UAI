import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:gestao_financeira/app/utils/ui_config_theme.dart';
import 'package:gestao_financeira/app/views/login/module/login_nome_rotas.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute("${LoginNomeRotas.modulo}${LoginNomeRotas.login}");
    Modular.setObservers([FlutterSmartDialog.observer]);

    return MaterialApp.router(
      builder: FlutterSmartDialog.init(),
      title: UiConfigTheme.title,
      debugShowCheckedModeBanner: false,
      theme: UiConfigTheme.themelight,
      darkTheme: UiConfigTheme.themelight,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }
}