// Frontend validation for login forms

class Validators {
  static String? shouldNotEmpty(String? value,
      {String message = "This field shouldn't be empty"}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) return message;
    return null;
  }

  String? emailValidator(String? value) {
    String? msg;
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value?.isEmpty ?? true) {
      msg = "Your email is required";
    } else if (!regex.hasMatch(value!)) {
      msg = "Please provide a valid email address";
    }
    return msg;
  }

  bool validatePasswordStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool isValidEmailId(String value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    final RegExp emojiRegex = RegExp(
        r'(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])');

    if (!regex.hasMatch(value) || value.contains(emojiRegex)) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidText({required String value, int min = 3, int maxLimit = 1000}) {
    if (value.isEmpty) {
      return false;
    } else if (value.length < min || value.length > maxLimit) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidPassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*?\W)(.){8,16}$');

    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidPhoneNumber(String value) {
    {
      String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return false;
      }
      return true;
    }
  }
}

class LoginValidator extends Validators {
  String? validateEmail(String? email) {
    return emailValidator(email);
  }

  String? validatePassword(String? password) {
    if (password?.isEmpty ?? true) {
      return "Please enter valid password, Password can't be empty.";
    } else if (!validatePasswordStructure(password!)) {
      return "Password should be at least one upper case, one lower case, one digit, one Special character & 6 characters in length.";
    }
    return null;
  }

  String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (validatePassword(password) == null && password != confirmPassword) {
      return "Password & Confirm password should be same.";
    }
    return null;
  }

  String? validateOldNewShouldNotSame(String? password, String? newPassword) {
    if (validatePassword(password) == null && password == newPassword) {
      return "New password can't same as old password";
    }

    String? newPasswordError = validatePassword(newPassword);
    if (newPasswordError != null) {
      return newPasswordError;
    }
    return null;
  }
}
