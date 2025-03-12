import 'dart:math';

import 'package:flutter/widgets.dart' show FormFieldValidator;

class Validators {
  static FormFieldValidator<String> required() {
    return (value) {
      if (value == null || value.isEmpty) {
        return "กรุณากรอกข้อมูล";
      }
      return null; // Ensure a return statement for valid input
    };
  }

  static FormFieldValidator<String> requiredNumber() {
    return (value) {
      if (value == null || value.isEmpty) {
        return "กรุณากรอกข้อมูล";
      }
      if (!RegExp(r'^\d+(\.\d+)?\$').hasMatch(value)) {
        return 'กรุณากรอกเฉพาะตัวเลข';
      }
      return null; // Ensure a return statement for valid input
    };
  }

  static FormFieldValidator<String> email(String errorMessage) {
    return (value) {
      if (value == null || value.isEmpty) {
        return null;
      } else {
        final emailRegex = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
        if (emailRegex.hasMatch(value)) {
          return null;
        } else {
          return errorMessage;
        }
      }
    };
  }
}
