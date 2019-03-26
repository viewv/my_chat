class Auth {
  String _username = 'zxn';
  String _password = '123456';

  String _newuser;
  String _newpass;

  bool login(String user, String password) {
    if ((user == _username && password == _password) ||
        (user == _newuser && password == _newpass)) {
      return true;
    } else {
      return false;
    }
  }

  bool signup(String user, String password) {
    _newuser = user;
    _newpass = password;
    return true;
  }
}
