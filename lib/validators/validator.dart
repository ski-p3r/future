class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    final RegExp emailRegex = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'); // Regex for email validation
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // Regex for password validation: at least one uppercase letter, one lowercase letter, one digit, and at least 6 characters
    final RegExp passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and at least 6 characters';
    }

    return null;
  }
}
