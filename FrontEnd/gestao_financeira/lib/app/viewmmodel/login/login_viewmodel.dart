import 'package:mobx/mobx.dart';

part 'login_viewmodel.g.dart';

class LoginViewModel = LoginViewmodelBase with _$LoginViewModel;

abstract class LoginViewmodelBase with Store {
  @observable
  bool chengeObscureText = false;

  @observable
  bool lembrarSenha = false;

  @action
  void changeObscureText() => chengeObscureText = !chengeObscureText;

  @action
  void changeLembrarSenha(bool value) => lembrarSenha = value;
}