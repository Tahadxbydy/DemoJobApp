String? isValidEmail(String? email) {
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  if (email == null || email.isEmpty) {
    return 'enter your email';
  } else if (emailRegExp.hasMatch(email) == false) {
    return 'enter a valid email';
  } else {
    return null;
  }
}

String? validatePassword(String? password) {
  if (password != null && password.isNotEmpty) {
    // if (RegExp(r'^.{6,}$').hasMatch(password.toString())) {
    //   return 'Password must be longer than 5';
    // }
    // if (!password.contains(RegExp(r'[A-Z]'))) {
    //   return 'Password must contain a capital letter';
    // }
    // if (!password.contains(RegExp(r'[a-z]'))) {
    //   return 'Password must contain a Lower case letter';
    // }
    // if (!password.contains(RegExp(r'[0-9]'))) {
    //   return 'Password must contain a number';
    // }
    // if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    //   return false;
    // }
    return null;
  } else {
    return 'enter a password';
  }
}

String? conirmPassword(String? confirmPassword, String? password) {
  if (password != null && password.isNotEmpty) {
    return confirmPassword == password ? null : 'password does not match';
  } else {
    return 'enter a password';
  }
}
