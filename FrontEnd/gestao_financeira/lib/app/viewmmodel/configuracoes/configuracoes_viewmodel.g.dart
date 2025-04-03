// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracoes_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfiguracoesViewmodel on ConfiguracoesViewmodelBase, Store {
  late final _$isDarkAtom =
      Atom(name: 'ConfiguracoesViewmodelBase.isDark', context: context);

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

  late final _$getThemeAsyncAction =
      AsyncAction('ConfiguracoesViewmodelBase.getTheme', context: context);

  @override
  Future<void> getTheme() {
    return _$getThemeAsyncAction.run(() => super.getTheme());
  }

  late final _$toggleThemeAsyncAction =
      AsyncAction('ConfiguracoesViewmodelBase.toggleTheme', context: context);

  @override
  Future<void> toggleTheme(bool value) {
    return _$toggleThemeAsyncAction.run(() => super.toggleTheme(value));
  }

  @override
  String toString() {
    return '''
isDark: ${isDark}
    ''';
  }
}
