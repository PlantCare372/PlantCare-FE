class LoginCredentials {
  static final LoginCredentials _loginCredentials = LoginCredentials._internal();
  static String _token = '';

  factory LoginCredentials() {
    return _loginCredentials;
  }

  static void setToken(String newToken) {
    _token = newToken;
  }

  static String getToken() {
    return _token;
  }

  LoginCredentials._internal();
}
