import 'package:gestao_financeira/app/database/local_storage/local_storage.dart';
import 'package:mobx/mobx.dart';

part 'configuracoes_viewmodel.g.dart';

class ConfiguracoesViewmodel = ConfiguracoesViewmodelBase with _$ConfiguracoesViewmodel;

abstract class ConfiguracoesViewmodelBase with Store {
  final LocalStorage _localStorage;

  ConfiguracoesViewmodelBase({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  @observable
  bool isDark = false;

  @action
  Future<void> getTheme() async {
    isDark = await _localStorage.isThemeDark();
  }

  @action
  Future<void> toggleTheme(bool value) async {
    await _localStorage.toggleTheme(value);
  }
}