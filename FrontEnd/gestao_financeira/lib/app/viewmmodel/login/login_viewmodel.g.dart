// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on LoginViewmodelBase, Store {
  late final _$chengeObscureTextAtom =
      Atom(name: 'LoginViewmodelBase.chengeObscureText', context: context);

  @override
  bool get chengeObscureText {
    _$chengeObscureTextAtom.reportRead();
    return super.chengeObscureText;
  }

  @override
  set chengeObscureText(bool value) {
    _$chengeObscureTextAtom.reportWrite(value, super.chengeObscureText, () {
      super.chengeObscureText = value;
    });
  }

  late final _$lembrarSenhaAtom =
      Atom(name: 'LoginViewmodelBase.lembrarSenha', context: context);

  @override
  bool get lembrarSenha {
    _$lembrarSenhaAtom.reportRead();
    return super.lembrarSenha;
  }

  @override
  set lembrarSenha(bool value) {
    _$lembrarSenhaAtom.reportWrite(value, super.lembrarSenha, () {
      super.lembrarSenha = value;
    });
  }

  late final _$LoginViewmodelBaseActionController =
      ActionController(name: 'LoginViewmodelBase', context: context);

  @override
  void changeObscureText() {
    final _$actionInfo = _$LoginViewmodelBaseActionController.startAction(
        name: 'LoginViewmodelBase.changeObscureText');
    try {
      return super.changeObscureText();
    } finally {
      _$LoginViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLembrarSenha(bool value) {
    final _$actionInfo = _$LoginViewmodelBaseActionController.startAction(
        name: 'LoginViewmodelBase.changeLembrarSenha');
    try {
      return super.changeLembrarSenha(value);
    } finally {
      _$LoginViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chengeObscureText: ${chengeObscureText},
lembrarSenha: ${lembrarSenha}
    ''';
  }
}
