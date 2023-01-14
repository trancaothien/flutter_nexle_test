extension EmailExtension on String {
  bool isValidateEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool isHaveLowerAndUpperCase() {
    return RegExp(r'^(?=.*[A-Z])(?=.*[a-z]).{6,}$').hasMatch(this);
  }

  bool isHaveNumber() {
    return RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9]).{6,}$').hasMatch(this);
  }

  bool isHaveSpecialChar() {
    return RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
        .hasMatch(this);
  }
}
