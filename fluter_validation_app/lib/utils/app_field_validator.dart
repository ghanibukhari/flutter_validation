// field validator to check user fields data
class FieldValidator {
  static bool validateAndSave(viewState) {
    final form = viewState.formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  static String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'Enter your name!';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email!.trim().isEmpty) {
      return 'Please enter email!';
    }
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(email)) {
      return 'Enter valid email!';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirm_password) {
    if (confirm_password == null || confirm_password.trim().isEmpty) {
      return 'Please enter confirm password!';
    }
    if (confirm_password.trim().length < 8) {
      return 'Confirm password length must be at least 8 characters';
    }
    if (confirm_password != password) {
      return 'Both passwords should match.';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return 'Please enter password!';
    }
    return null;
  }
}
