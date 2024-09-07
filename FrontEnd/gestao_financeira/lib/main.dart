

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_financeira/app/app_module.dart';
import 'package:gestao_financeira/app/app_widget.dart';
import 'package:gestao_financeira/app/utils/environments.dart';
import 'package:responsive_builder/responsive_builder.dart';

Future<void> main() async {
  await Environments.loadEnvs();
  WidgetsFlutterBinding.ensureInitialized();
  

  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool inDebug = false; 
    assert(() {
      inDebug = true;
      return true;
    }());
    if (inDebug) {
      return ErrorWidget(details.exception);
    }
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Error: ${details.exception}',
        style: const TextStyle(
          color: Colors.orangeAccent,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  };

  runApp(
    ResponsiveApp(
      builder: (context) {
        return ModularApp(
          module: AppModule(),
          child: const AppWidget(),
        );
      },
    ),
  );
}
