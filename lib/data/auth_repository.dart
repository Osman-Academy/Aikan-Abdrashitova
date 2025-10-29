class AuthRepository {
  bool _isLoggedIn = false;
  String? _userToken;

  Future<bool> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if (username.isNotEmpty && password.isNotEmpty) {
      _isLoggedIn = true;
      _userToken = "fake_token_123";
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 1));
    _isLoggedIn = false;
    _userToken = null;
  }

  bool get isLoggedIn => _isLoggedIn;
  String? get userToken => _userToken;
}
