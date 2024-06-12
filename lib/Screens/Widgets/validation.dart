class Validation {


  static String? validateCommon(String? value, ) {
    if (value!.isEmpty) {
      return "this field is required";
    }
    return null;
  }

  static String? validateUserName(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Username";
    }
    return null;
  }
  static String? validateUserNamePassLogIn(String? value) {
    if (value!.isEmpty) {
      return "";
    }
    return null;
  }

  static String? validateMobileNumber(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Mobile Number";
    } else if (value.length < 10) {
      return "Invalid Mobile Number";
    }
    return null;
  }

  static String? validateEmailId(String? value) {
    RegExp regExp =RegExp(
        r"^[a-zA-Z\d.a-zA-Z!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+");
    if (value!.isEmpty) {
      return "Please Enter Email";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid email address";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Required";
    } else if (value.length < 6) {
      return "Should at least 6 characters";
    }
    return null;
  }



}
