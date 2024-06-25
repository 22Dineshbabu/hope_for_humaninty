// import 'package:flutter/material.dart';

import 'package:hope_for_humaninty/Models/signup_details.dart';

class ValidateFields {
  ValidateFields({
    required this.isSame,
    required this.field,
    required this.value,
    required this.type,
    this.signupDetails = const [],
  });
  String? value;
  String field;
  String type;
  String isSame;
  List<SignupDetails> signupDetails;

  String _errorMessage = '';
  // TextEditingController passwordEditController;

  String? validateType() {
    if (type == 'Email') {
      if (value == null || value!.isEmpty) {
        return 'This field can\'t be empty';
      } else if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(field)) {
        return 'Please enter valid email id';
      }
      if (signupDetails != []) {
        for (int i = 0; i < signupDetails.length; i++) {
          if (value == signupDetails[i].email) {
            return 'The email Id already exist. Please login or try signup with different email.';
          }
        }
      }
      return null;
    } else if (type == 'Password') {
      if (value == null || value!.isEmpty) {
        return 'This field can\'t be empty';
      }

      _errorMessage = '';

      if (!value!.contains(RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
        // Password length greater than 6
        if (value!.length < 8) {
          _errorMessage += 'Password must be longer than 8 characters.\n';
        }
        // Contains at least one uppercase letter
        if (!value!.contains(RegExp(r'[A-Z]'))) {
          _errorMessage += '• Uppercase letter is missing.\n';
        }
        // Contains at least one lowercase letter
        if (!value!.contains(RegExp(r'[a-z]'))) {
          _errorMessage += '• Lowercase letter is missing.\n';
        }
        // Contains at least one digit
        if (!value!.contains(RegExp(r'[0-9]'))) {
          _errorMessage += '• Number is missing.\n';
        }
        // Contains at least one special character
        if (!value!.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
          _errorMessage += '• Special character is missing.\n';
        }
        // If there are no error messages, the password is valid
        return _errorMessage;
      }
      return null;
    } else if (type == 'Name') {
      if (num.tryParse(value!) != null) {
        return 'Only alphbets are allowed';
      }

      if (value == null || value!.isEmpty) {
        return 'This field can\'t be empty';
      }
      return null;
    } else if (type == 'Confirm Password') {
      if (value == null || value!.isEmpty) {
        return 'This field can\'t be empty';
      }
    }
    if (isSame != 'null') {
      if (value != isSame) {
        return 'Passwords didn\'t match';
      }
      if (value == isSame) {
        return null;
      }
    }
    return null;
  }
}
