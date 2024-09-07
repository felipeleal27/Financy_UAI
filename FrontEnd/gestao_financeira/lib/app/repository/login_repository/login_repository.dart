abstract interface class LoginRepository {
  Future<bool> login(String codigo, String senha);
}