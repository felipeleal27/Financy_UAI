import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:gestao_financeira/app/utils/ui_config_theme.dart';
import 'package:gestao_financeira/app/views/splash_screen/module/splash_screen_nome_rotas.dart';


class AppWidget extends StatefulWidget {
  final bool isDark;

  const AppWidget({super.key, required this.isDark});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    UiConfigTheme.themeMode.value = widget.isDark ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(
        "${SplashScreenNomeRotas.modulo}${SplashScreenNomeRotas.inicial}");
    Modular.setObservers([FlutterSmartDialog.observer]);

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: UiConfigTheme.themeMode,
      builder: (context, themeMode, _) {
        return MaterialApp.router(
          builder: FlutterSmartDialog.init(),
          title: UiConfigTheme.title,
          debugShowCheckedModeBanner: false,
          theme: UiConfigTheme.themelight,
          darkTheme: UiConfigTheme.themedark,
          themeMode: themeMode,
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('pt', 'BR')],
        );
      },
    );
  }
}

