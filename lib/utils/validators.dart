class Validators {
  static String? email(String? input) {
    if (input!.isEmpty) {
      return "Email Address cannot be empty.";
    }
    bool isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input);
    if (!isValid) {
      return "Email Address is Not Valid";
    }
    return null;
  }

  static String? isRequired(String? input) {
    if (input == null || input.isEmpty) {
      return "This is a required field.";
    }
    return null;
  }

  static String? password(String? input) {
    if (input!.isEmpty) {
      return "Password cannot be empty.";
    }
    if (input.length < 8) {
      return "Password cannot be less then 8 characters.";
    }

    return null;
  }

  static String? confirmPassword(String? input, String newPassword) {
    if (input!.isEmpty) {
      return "Password cannot be empty.";
    }
    if (input != newPassword) {
      return "Password did not match.";
    }

    return null;
  }

  static String? phone(String? input) {
    if (input!.isEmpty) {
      return "Enter a phone number";
    }
    bool isValid = RegExp(r'^9\d{8,9}$').hasMatch(input);
    if (!isValid) {
      return "Enter a valid phone number";
    }
    return null;
  }
}
