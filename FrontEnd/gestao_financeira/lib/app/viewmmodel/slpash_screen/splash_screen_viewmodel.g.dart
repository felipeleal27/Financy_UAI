// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_screen_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashScreenViewmodel on SplashScreenViewmodelBase, Store {
  late final _$timerAtom =
      Atom(name: 'SplashScreenViewmodelBase.timer', context: context);

  @override
  Duration? get timer {
    _$timerAtom.reportRead();
    return super.timer;
  }

  @override
  set timer(Duration? value) {
    _$timerAtom.reportWrite(value, super.timer, () {
      super.timer = value;
    });
  }

  late final _$isDarkAtom =
      Atom(name: 'SplashScreenViewmodelBase.isDark', context: context);

  @override
  bool get isDark {
    _$isDarkAtom.reportRead();
    return super.isDark;
  }

  @override
  set isDark(bool value) {
    _$isDarkAtom.reportWrite(value, super.isDark, () {
      super.isDark = value;
    });
  }

  late final _$setThemeAsyncAction =
      AsyncAction('SplashScreenViewmodelBase.setTheme', context: context);

  @override
  Future<void> setTheme() {
    return _$setThemeAsyncAction.run(() => super.setTheme());
  }

  @override
  String toString() {
    return '''
timer: ${timer},
isDark: ${isDark}
    ''';
  }
}
