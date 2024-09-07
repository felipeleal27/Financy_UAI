import 'package:gestao_financeira/app/repository/login_repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<bool> login(String codigo, String senha) async {
    return true;
  }
}
