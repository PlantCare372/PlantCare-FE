class LoginCredentials {
  static final LoginCredentials _loginCredentials = LoginCredentials._internal();
  static String _token = '';
  static String _userName = '';
  static String _email = '';
  static String _id = '';

  factory LoginCredentials() {
    return _loginCredentials;
  }

  static void setToken(String newToken) {
    _token = newToken;
  }

  static String getToken() {
    return _token;
  }

  static void setUserName(String newUsername) {
    _userName = newUsername;
  }

  static String getUserName() {
    return _userName;
  }

  static void setEmail(String newEmail) {
    _email = newEmail;
  }

  static String getEmail() {
    return _email;
  }

  LoginCredentials._internal();

  static void setUserId(String id) {
    _id = _id;
  }

  static String getUserId() {
    return _id;
  }
}
