import 'package:mobx/mobx.dart';

part 'login_viewmodel.g.dart';

class LoginViewModel = LoginViewmodelBase with _$LoginViewModel;

abstract class LoginViewmodelBase with Store {
  @observable
  bool chengeObscureText = false;
}