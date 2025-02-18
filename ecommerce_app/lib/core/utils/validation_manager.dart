class ValidationManager {
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$',
  );

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static bool isValidPassword(String password) =>
      _passwordRegExp.hasMatch(password);
  static bool isValidEmail(String email) => _emailRegExp.hasMatch(email);
}
