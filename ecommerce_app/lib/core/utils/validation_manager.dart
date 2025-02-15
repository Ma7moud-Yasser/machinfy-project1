class ValidationManager {
  // Validates whether the password meets the criteria: at least 8 characters long, one uppercase letter, one lowercase letter, one digit, and one special character
  static bool isValidPassword(String password) {
    final RegExp passwordRegExp =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$');
    return passwordRegExp.hasMatch(password);
  }

  // Validates whether the email follows the basic email format
  static bool isValidEmail(String email) {
    // Email regex pattern for basic validation
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  static String isValidEmailString(String email) {
    if (email.isEmpty) {
      return 'البريد الإلكتروني فارغ.';
    } else {
      // Email regex pattern for basic validation
      final RegExp emailRegExp =
          RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
      if (!emailRegExp.hasMatch(email)) {
        return 'البريد الإلكتروني غير صالح.';
      }
    }
    return 'البريد الإلكتروني صالح.';
  }

  static String isValidPasswordString(String password) {
    if (password.isEmpty) {
      return 'كلمة المرور فارغة.';
    } else {
      // Password regex pattern for basic validation
      final RegExp passwordRegExp =
          RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$');
      if (!passwordRegExp.hasMatch(password)) {
        return 'كلمة المرور: 8+ أحرف، حرف كبير وصغير، رقم، ورمز خاص.';
      }
    }
    return 'كلمة المرور صالحة.';
  }
}
